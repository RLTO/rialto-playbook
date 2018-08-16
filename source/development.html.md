# Development Flow

## Git Protocol

A guide for programming within version control.

### Maintain a repo

* Avoid including files in source control that are specific to your
  development machine or process.
* Delete local and remote feature branches after merging.
* Perform work in a feature branch.
* Rebase frequently to incorporate upstream changes.
* Use a [pull request] for code reviews.

[pull request]: https://help.github.com/articles/using-pull-requests/

### Write a Feature

Create a local feature branch based off master.

    git checkout master
    git pull
    git checkout -b feature/<branch-name>
    eg. git checkout -b feature/new-awesome-feature

Rebase frequently to incorporate upstream changes.

    git fetch (origin)
    git rebase (origin/)master

Resolve conflicts. When feature is complete and tests pass, stage the changes.

    git add .

When you've staged the changes, commit them.

    git status
    git commit

Write a [good commit message]. Example format:

    Capitalised present-tense summary under 50 characters

    * More information about commit (under 72 characters).
    * Even more information about commit (under 72 characters).

    http://project.management-system.com/ticket/123

If you've created more than one commit,
[use `git rebase` interactively](https://help.github.com/articles/about-git-rebase/)
to squash them into cohesive commits with good messages:

    git rebase -i (origin/)master

Share your branch.

    git push (origin) <branch-name>

Submit a [GitHub pull request].

**Link Pull Request to the corresponding ticket on Trello via Github plugin.**

[good commit message]: http://chris.beams.io/posts/git-commit/
[GitHub pull request]: https://help.github.com/articles/using-pull-requests/
[closing]: https://help.github.com/articles/closing-issues-via-commit-messages/

## Code Review

A team member other than the author reviews the pull request. They follow
[Code Review](https://github.com/RLTO/rialto-api/wiki/3.3-Code-Review) guidelines to avoid
miscommunication.

They make comments and ask questions directly on lines of code in the GitHub
web interface.

When satisfied, they merge the pull request and remove the feature branch.

### Everyone

* Accept that many programming decisions are opinions. Discuss tradeoffs, which
  you prefer, and reach a resolution quickly.
* Ask questions; don't make demands. ("What do you think about naming this
  `:user_id`?")
* Ask for clarification. ("I didn't understand. Can you clarify?")
* Avoid selective ownership of code. ("mine", "not mine", "yours")
* Avoid using terms that could be seen as referring to personal traits. ("dumb",
  "stupid"). Assume everyone is attractive, intelligent, and well-meaning.
* Be explicit. Remember people don't always understand your intentions online.
* Be humble. ("I'm not sure - let's look it up.")
* Don't use hyperbole. ("always", "never", "endlessly", "nothing")
* Don't use sarcasm.
* Keep it real. If emoji, animated gifs, or humor aren't you, don't force them.
  If they are, use them with aplomb.
* Talk in person if there are too many "I didn't understand" or "Alternative
  solution:" comments. Post a follow-up comment summarizing offline discussion.

### Having Your Code Reviewed

* Be grateful for the reviewer's suggestions. ("Good call. I'll make that
  change.")
* Don't take it personally. The review is of the code, not you.
* Explain why the code exists. ("It's like that because of these reasons. Would
  it be more clear if I rename this class/file/method/variable?")
* Extract some changes and refactorings into future tickets/stories.
* Link to the code review from the ticket/story. ("Ready for review:
  https://github.com/organization/project/pull/1")
* Push commits based on earlier rounds of feedback as isolated commits to the
  branch. Do not squash until the branch is ready to merge. Reviewers should be
  able to read individual updates based on their earlier feedback.
* Seek to understand the reviewer's perspective.
* Try to respond to every comment.
* Wait to merge the branch until Continuous Integration (Codeship)
  tells you the test suite is green in the branch.
* Merge once you feel confident in the code and its impact on the project.

### Reviewing Code

Understand why the change is necessary (fixes a bug, improves the user
experience, refactors the existing code). Then:

* Communicate which ideas you feel strongly about and those you don't.
* Identify ways to simplify the code while still solving the problem.
* If discussions turn too philosophical or academic, move the discussion offline
  to a regular Friday afternoon technique discussion. In the meantime, let the
  author make the final decision on alternative implementations.
* Offer alternative implementations, but assume the author already considered
  them. ("What do you think about using a custom validator here?")
* Seek to understand the author's perspective.
* Sign off on the pull request with a :thumbsup: or "Ready to merge" comment.

### Style Comments

Reviewers should comment on missed [style](https://github.com/bbatsov/ruby-style-guide)
guidelines. These guidelines are enforced by [Rubocop](https://github.com/bbatsov/rubocop), an static code linter for Ruby. (We have a [Codeclimate](https://codeclimate.com) integration on Github which will automatically style check our code).
Example comment:

    > Order resourceful routes alphabetically by name.

An example response to style comments:

    Whoops. Good catch, thanks.

If you disagree with a guideline, bring the discussion to the team and if necessary we can change Rubocop config.

### Adjusting code

When both reviewer and author agree on what commits should be changed in this pull-request, try and adjust the corresponding commit with either `git commit --fixup` (and don't forget to autosquash afterwards) or go back to the commit with `git commit -i`(interactive rebase).