title=Project Information		
type=page
status=published
tags=mailinglists,issuetracker,sourcecode,git,github
~~~~~~

This document provides an overview of the various documents and links that are part of this project's general information:

* [Community Roles and Processes](/project-information/apache-sling-community-roles-and-processes.html)
* [Project Team](/project-information/project-team.html)
* [Mailing Lists](#mailing-lists)
* [Issue Tracking](#issue-tracking)
* [Source Repository](#source-repository)
* [Continuous Integration](#continuous-integration)
* [Project License](/project-information/project-license.html)
* [Documentation Repository](#documentation-repository)


## Mailing Lists

The following English-speaking mailing lists have been established for this project. For each list, there is a subscribe,
unsubscribe, and an archive link.

The Sling Users List is the preferred way of getting help with Sling. However, you can also [Ask a Sling question on StackOverflow](http://stackoverflow.com/questions/ask?tags=sling) if you prefer.

Please subscribe before posting messages to these lists. If you don't, your messages are likely to be delayed, as we need to moderate them,
or maybe even become lost in the flow of spam that we get from non-subscribed senders.

| Name | Subscribe | Unsubscribe | Post | ASF Archive | Other Archives |
|---|---|---|---|---|---|
| Users List | [Subscribe](mailto:users-subscribe@sling.apache.org) | [Unsubscribe](mailto:users-unsubscribe@sling.apache.org) | users at sling.apache.org | [lists.apache.org](https://lists.apache.org/list.html?users@sling.apache.org) | [www.mail-archive.com](http://www.mail-archive.com/users@sling.apache.org/) |
| Developers List | [Subscribe](mailto:dev-subscribe@sling.apache.org) | [Unsubscribe](mailto:dev-unsubscribe@sling.apache.org) | dev at sling.apache.org | [lists.apache.org](https://lists.apache.org/list.html?dev@sling.apache.org) | [www.mail-archive.com](http://www.mail-archive.com/dev@sling.apache.org/) |
| Commit Events List | [Subscribe](mailto:commits-subscribe@sling.apache.org) | [Unsubscribe](mailto:commits-unsubscribe@sling.apache.org) | <automated> | [lists.apache.org](https://lists.apache.org/list.html?commits@sling.apache.org) | [www.mail-archive.com](http://www.mail-archive.com/commits@sling.apache.org/) |


## Issue Tracking

This project uses JIRA a J2EE-based, issue tracking and project management application. Issues, bugs, and feature requests should be submitted to the following issue tracking system for this project.

The issue tracker can be found at [http://issues.apache.org/jira/browse/SLING](http://issues.apache.org/jira/browse/SLING)

## Source Repository

This project uses Git to manage its source code. The source code is hosted on the [ASF GitBox setup](https://gitbox.apache.org/repos/asf)
and replicated to [Apache organisation on GitHub](https://github.com/apache/). As a developer you may push to either GitBox or GitHub. Note however that for GitHub to work you need to set up your GitHub account with two-factor authentication from [the main GitBox page](https://gitbox.apache.org/).

To check out the Sling source code, see the instructions from  [Getting and building Sling](/documentation/development/getting-and-building-sling.html#getting-the-sling-source).

For additional information see [Using Git with Sling](https://cwiki.apache.org/confluence/display/SLING/Using+Git+with+Sling).

### Web Access

The source code can be accessed using either the GitHub or GitBox setup. 

To list all modules on GitHub you can use this search query: [https://github.com/apache/?q=sling](https://github.com/apache/?q=sling), or
see our [list of repositories](/repolist.html) on this website.

### Attic / deprecated modules
See [Deprecating Sling Modules](/documentation/development/deprecating-sling-modules.html) for how we manage
module deprecation.

## Continuous Integration

The [Sling+Jenkins+Setup](https://cwiki.apache.org/confluence/display/SLING/Sling+Jenkins+Setup) wiki page describes
the setup that runs Sling builds automatically (triggered by commits) on the 
[ASF's Jenkins instance](https://builds.apache.org/). 

The [Sling Monitor](https://builds.apache.org/view/Sling-Monitor/) page lists jobs that need attention.

The [Sling Folder](https://builds.apache.org/job/Sling/) page lists all jobs.

In any case you wish to customize the jenkins build of a module, just add a `.sling-module.json` at the root of your project,
with overriden values listed in Jenkins [Sling module descriptor](https://cwiki.apache.org/confluence/display/SLING/Sling+module+descriptor).

## Documentation Repository
The documentation website, in fact the very page that you are reading right now, is located at [The Apache Sling Site Project](https://gitbox.apache.org/repos/asf?p=sling-site.git). You can contribute without being an official project committer.

###Submitting a patch to the Sling Site project

####Create a Git patch:

1. Locally check out the git repository.
1. Edit the documentation, don't commit.
1. From the command line `git diff > site.patch`.

####Submit your changes:

1. Navigate to the [Jira issue tracker](https://issues.apache.org/jira/browse/SLING).
1. Create an account and/or login.
1. Create a ticket, enter a description and choose *Documentation* for *Components*.
1. Select the ticket, click *more*, select *attach files* and attach your Git patch.

Additionally there is a Github hosted [Apache Sling Site Project Mirror](https://github.com/apache/sling-site) which can be used to submit changes as well.

###Submitting a pull request to the GitHub Sling Site mirror

####Create the Pull Request:

1. Navigate to the [Apache Sling Site Project Mirror](https://github.com/apache/sling-site).
1. Create an account and/or login.
1. Edit the documentation using the edit icon *Fork this project and edit this file*.
1. Once all changes are done click *New pull request*.
1. Select *base fork:apache/sling-site* *base:master* as the project to push to
