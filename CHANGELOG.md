# Change Log
All notable changes to this project will be documented in this file.

## [v3.13.6]

### Changed

- Improved parameters validation for `PUT /active-response` endpoint ([#504](https://github.com/cyb3rhq/cyb3rhq-api/pull/504)).

## [v3.13.5]

### Changed

- Upgrade moment dependency to 2.29.3 ([#503](https://github.com/cyb3rhq/cyb3rhq-api/pull/503)).

## [v3.13.4]

There are no changes for Cyb3rhq API in this version.

## [v3.13.3]

There are no changes for Cyb3rhq API in this version.

## [v3.13.2]

There are no changes for Cyb3rhq API in this version.

## [v3.13.1]

### Added

- New filters in request `GET /sca/:agent_id/checks/:policy_id`:
    * `reason`: Filters the SCA checks by 'reason' field ([#492](https://github.com/cyb3rhq/cyb3rhq-api/issues/492)).
    * `status`: Filters the SCA checks by 'status' field ([#492](https://github.com/cyb3rhq/cyb3rhq-api/issues/492)).
    * `command`: Filters the SCA checks by 'command' field ([#492](https://github.com/cyb3rhq/cyb3rhq-api/issues/492)).

## [v3.13.0]

### Added

- New API requests:
    * `GET/mitre` ([#452](https://github.com/cyb3rhq/cyb3rhq-api/pull/452))
    * `GET/rules/mitre`
    * `GET/rules/tsc` ([commit](https://github.com/cyb3rhq/cyb3rhq-api/commit/719563a6e18581a2c062ba0f6a950730ac74222d))

- New filters in request `GET/rules`:
    - `mitre`: Filters the rules by mitre requirement
    - `tsc`: Filters the rules by tsc requirement

### Changed

- Increase the maximum allowed size of the files to be uploaded from 1MB to 10MB ([#487](https://github.com/cyb3rhq/cyb3rhq-api/pull/487)). This change applies to:
    * `POST /manager/files`
    * `POST /cluster/:node_id/files`
    * `POST /agents/groups/:group_id/configuration`
    * `POST /agents/groups/:group_id/files/:file_name`

## [v3.12.3]

There are no changes for Cyb3rhq API in this version.

## [v3.12.2]

There are no changes for Cyb3rhq API in this version.

## [v3.12.1]

There are no changes for Cyb3rhq API in this version.

## [v3.12.0]

### Added

- Improvements in the security of the API. `HTTPS` is enabled by default ([#442](https://github.com/cyb3rhq/cyb3rhq-api/pull/442)).
- Added distinct parameter ([#475](https://github.com/cyb3rhq/cyb3rhq-api/pull/475)).

### Changed
- Now endpoint `GET /sca/:agent_id/checks/:policy_id` shows `condition` fields and can be used to filter by ([#4012](https://github.com/cyb3rhq/cyb3rhq/issues/4012))

### Fixed
- Fixed bug with API requests not being properly distributed to the selected node_id: ([#479](https://github.com/cyb3rhq/cyb3rhq-api/pull/479)).
    * `GET /cluster/{node_id}/stats/analysisd`
    * `GET /cluster/{node_id}/stats/remoted`


## [v3.11.0]

## Added
- The query parameter (q) now can be used filter rules, decoders or logs ([#248](https://github.com/cyb3rhq/cyb3rhq-api/issues/248))
- New API requests:
    * `PUT /agents/group/{group_id}/restart` to restart all agents in a group ([#411](https://github.com/cyb3rhq/cyb3rhq-api/issues/411))
    * `GET /syscollector/:agent_id/hotfixes` to get hotfixes info ([#423](https://github.com/cyb3rhq/cyb3rhq-api/pull/423))

## Changed
- Improved error descriptions for the `PUT /agents/:agent_id/upgrade_custom` API call ([#3911](https://github.com/cyb3rhq/cyb3rhq/issues/3911))


## [v3.10.1]

There are no changes for Cyb3rhq API in this version.


## [v3.10.0]

### Added

- New API requests:
    * `GET/rules/hipaa` ([#397](https://github.com/cyb3rhq/cyb3rhq-api/pull/397)).
    * `GET/rules/nist-800-53` ([#397](https://github.com/cyb3rhq/cyb3rhq-api/pull/397)).
    * `GET/rules/gpg13` ([#389](https://github.com/cyb3rhq/cyb3rhq-api/pull/389)).
    * `GET/summary/agents` ([#429](https://github.com/cyb3rhq/cyb3rhq-api/pull/429)).
- New filters in request `GET/rules`:
    - `hipaa`: Filters the rules by hipaa requirement ([#397](https://github.com/cyb3rhq/cyb3rhq-api/pull/397)).
    - `nist-800-53`: Filters the rules by nist-800-53 requirement ([#397](https://github.com/cyb3rhq/cyb3rhq-api/pull/397)).
    - `gpg13`: Filters the rules by gpg13 requirement ([#389](https://github.com/cyb3rhq/cyb3rhq-api/pull/389)).
- Improvements in the security of passwords stored, changed from MD5 to BCrypt encryption, cost 10 as recommended `scripts/configure_api.sh` [#404](https://github.com/cyb3rhq/cyb3rhq-api/pull/404), thanks @hemedga
- Added Docker environment for Mocha tests ([#400](https://github.com/cyb3rhq/cyb3rhq-api/pull/400)).

### Fixed
- Fixed bug inserting duplicated agent without any errors ([#318](https://github.com/cyb3rhq/cyb3rhq-api/issues/318))
- Fixed exception handling for `DELETE/agents` ([#441](https://github.com/cyb3rhq/cyb3rhq-api/pull/441))
- Fixed API installation in Docker CentOS 7 containers ([#408](https://github.com/cyb3rhq/cyb3rhq-api/pull/408))
- Deleted cache usage  in `POST/agents` ([#403](https://github.com/cyb3rhq/cyb3rhq-api/pull/403))

## [v3.9.0]

### Added
- Added API calls to edit configuration files (ossec.conf, rules, lists and decodes) ([#308](https://github.com/cyb3rhq/cyb3rhq-api/pull/308) and [#299](https://github.com/cyb3rhq/cyb3rhq-api/pull/299))
- Added API calls to restart manager nodes in the cluster and validate configuration ([#307](https://github.com/cyb3rhq/cyb3rhq-api/pull/307))
- Added API calls to get CDB lists ([#301](https://github.com/cyb3rhq/cyb3rhq-api/pull/301))
- Added API calls to get security configuration assessment policies and checks ([#321](https://github.com/cyb3rhq/cyb3rhq-api/pull/321))
- Added filtering by `version` field in `GET/experimental/syscollector/packages` API call ([#340](https://github.com/cyb3rhq/cyb3rhq-api/pull/340)).

### Fixed
- Fixed documentation regarding DELETE /agents API call and older_than default value ([#319](https://github.com/cyb3rhq/cyb3rhq-api/pull/319))

## [v3.8.2]

There are no changes for Cyb3rhq API in this version.


## [v3.8.1]

### Fixed
- Fixed improper error handling ([#296](https://github.com/cyb3rhq/cyb3rhq-api/pull/296)).
- Fix bug setting file permissions when rotating API logs file ([#295](https://github.com/cyb3rhq/cyb3rhq-api/pull/295)).

## [v3.8.0]

### Added
- Added API calls to upgrade agent groups configuration ([#257](https://github.com/cyb3rhq/cyb3rhq-api/pull/257)):
    - `POST/agents/groups/:group_id/configuration`
    - `POST/agents/groups/:group_id/files/:file_name`
- Added filtering by interface name in `GET/syscollector/:agent_id/netaddr` ([#260](https://github.com/cyb3rhq/cyb3rhq-api/pull/260)).
- Added API call to delete multiple agents from a group: `DELETE/agents/group/:group_id` ([#259](https://github.com/cyb3rhq/cyb3rhq-api/pull/259)).
- Added API call to add multiple agents to a group: `POST/agents/group/:group_id` ([#256](https://github.com/cyb3rhq/cyb3rhq-api/pull/256)).
- Added a `format` parameter to `POST/agents/groups/:group_id/files/:file_name` ([#257](https://github.com/cyb3rhq/cyb3rhq-api/pull/257)):
    - `format=json` returns file information in JSON format.
    - `format=xml` returns file information in RAW format as a string.

### Fixed
- Fixed bug getting ossec gid and uid in Docker containers ([#256](https://github.com/cyb3rhq/cyb3rhq-api/pull/265)).
- Fixed bug missing some keys when showing group files in `GET/agents/groups/:group_id/files/:file_name` ([cyb3rhq/cyb3rhq#2223](https://github.com/cyb3rhq/cyb3rhq/pull/2223)).
- Fixed bug showing rules variables names instead of its value in `GET/rules/:rule_id` ([cyb3rhq/cyb3rhq#2222](https://github.com/cyb3rhq/cyb3rhq/pull/2222)).
- `GET/rules` API call returns the attributes for `<list>` and `<info>` ([cyb3rhq/cyb3rhq#2358](https://github.com/cyb3rhq/cyb3rhq/pull/2358)).

## [v3.7.2]

There are no changes for Cyb3rhq API in this version.


## [v3.7.1]

There are no changes for Cyb3rhq API in this version.


## [v3.7.0]

### Added
- Added support for queries in agents, rootcheck and syscheck API requests ([#128](https://github.com/cyb3rhq/cyb3rhq-api/pull/128))
- Added API support for multigroups ([#159](https://github.com/cyb3rhq/cyb3rhq-api/pull/159))
- Add `hash` parameter to `GET/agents/groups/:group_id/files` API call ([#166](https://github.com/cyb3rhq/cyb3rhq-api/pull/166))
- Retieve agent configuration on demand: `GET/agents/:agent_id/config/:component/:configuration` API call ([#72](https://github.com/cyb3rhq/cyb3rhq-api/pull/72))
- Added statistical data for `analysisd` and `remoted`. ([#158](https://github.com/cyb3rhq/cyb3rhq-api/pull/158)) ([#213](https://github.com/cyb3rhq/cyb3rhq-api/pull/213))
  - `GET/manager/stats/analysisd` to query Analysisd statistics.
  - `GET/manager/stats/remoted` to query Remoted statistics.
  - `GET/cluster/:node_id/stats/analysisd` to query Remoted statistics on a specific node.
  - `GET/cluster/:node_id/stats/remoted` to query Remoted statistics on a specific node.
- Add _OS Query wodle_ configuration to `GET/manager/configuration` API call ([cyb3rhq/cyb3rhq#1585](https://github.com/cyb3rhq/cyb3rhq/pull/1585))
- Add _Vulnerability detector wodle_ configuration to `GET/manager/configuration` API call ([cyb3rhq/cyb3rhq#1453](https://github.com/cyb3rhq/cyb3rhq/pull/1453))
- Check if an agent's group configuration is synchronized: `GET/agent/:agent_id/group/is_sync` API call ([#180](https://github.com/cyb3rhq/cyb3rhq-api/pull/180))
- Prevent using API in worker nodes ([#229](https://github.com/cyb3rhq/cyb3rhq-api/pull/229))

### Changed
- Changed api.log permissions. Now it is installed with 640 permissions and ossec:ossec owner ([#164](https://github.com/cyb3rhq/cyb3rhq-api/pull/164))
- Field `group` from agents API calls is now returned as a list ([cyb3rhq/cyb3rhq#1437](https://github.com/cyb3rhq/cyb3rhq/pull/1437))
- Improve symbolic link for htpasswd ([#205](https://github.com/cyb3rhq/cyb3rhq-api/pull/205))

### Fixed
- Fixed error showing logs containing strange characters ([cyb3rhq/cyb3rhq#1584](https://github.com/cyb3rhq/cyb3rhq/pull/1584))
- Fixed error when registering an agent named `%` ([#178](https://github.com/cyb3rhq/cyb3rhq-api/pull/178))
- Fix error when limiting results in syscollector API calls ([cyb3rhq/cyb3rhq#1457](https://github.com/cyb3rhq/cyb3rhq/pull/1457))
- NodeJS 5 compatibility ([#209](https://github.com/cyb3rhq/cyb3rhq-api/pull/209))

### Removed
- Removed `id` field from syscollector network API calls ([#169](https://github.com/cyb3rhq/cyb3rhq-api/pull/169))
- Removed `event` filter from `GET/syscheck/:agent_id` API call ([#721](https://github.com/cyb3rhq/cyb3rhq-api/pull/171))


## [v3.6.1]

### Added
- Add PUT/active-response/:agent_id API call ([#151](https://github.com/cyb3rhq/cyb3rhq-api/pull/151)).

## [v3.6.0]

### Added
- Name and ip filters to GET /agents request ([#143](https://github.com/cyb3rhq/cyb3rhq-api/pull/143)).


## [v3.5.0]

### Added
- Show authenticated user in API logs ([#67](https://github.com/cyb3rhq/cyb3rhq-api/pull/67)).
- New API requests for Syscollector ([#89](https://github.com/cyb3rhq/cyb3rhq-api/pull/89)):
    * `GET/experimental/syscollector/processes`.
    * `GET/syscollector/:agent_id/processes`.
    * `GET/experimental/syscollector/ports`.
    * `GET/syscollector/:agent_id/ports`.
    * `GET/experimental/syscollector/netaddr`.
    * `GET/syscollector/:agent_id/netaddr`.
    * `GET/experimental/syscollector/netproto`.
    * `GET/syscollector/:agent_id/netproto`.
    * `GET/experimental/syscollector/netiface`.
    * `GET/syscollector/:agent_id/netiface`.
- Option to download the wpk using HTTP in `UPDATE/agents/:agent_id/upgrade`. ([#109](https://github.com/cyb3rhq/cyb3rhq-api/pull/109))
- Rotate log files at midnight. ([#117](https://github.com/cyb3rhq/cyb3rhq-api/pull/117))
- New API requests for the CIS-CAT module ([#142](https://github.com/cyb3rhq/cyb3rhq-api/pull/142)):
    * `GET/experimental/ciscat/results`.
    * `GET/ciscat/:agent_id/results`.


### Changed
- Renamed `merged_sum` and `conf_sum` fields to `mergedSum` and `configSum` in `GET/agents/groups` ([cyb3rhq/cyb3rhq#761](https://github.com/cyb3rhq/cyb3rhq/pull/761)).
- Added more log levels to the output in `GET/manager/logs/summary`: `error`, `info`, `critical`, `warning` and `debug` ([cyb3rhq/cyb3rhq#856](https://github.com/cyb3rhq/cyb3rhq/pull/856)).
- Updated `api-register-agent.ps1` to use TLS 1.2 ([#51](https://github.com/cyb3rhq/cyb3rhq-api/pull/51)).
- Input validation accepts more characters ([#83](https://github.com/cyb3rhq/cyb3rhq-api/pull/83)).

### Fixed
- Fixed bug when reading logs with non-ascii characters in `GET/manager/logs` ([cyb3rhq/cyb3rhq#856](https://github.com/cyb3rhq/cyb3rhq/pull/856)).
- Fixed error sorting fields that have both uppercase and lowercase characters ([cyb3rhq/cyb3rhq#814](https://github.com/cyb3rhq/cyb3rhq/pull/814)).
- Adapted `api-register-agent.ps1` to the changes of ossec.conf ([#51](https://github.com/cyb3rhq/cyb3rhq-api/pull/51)).


## [v3.4.0]
### Added
- Improved agent registration/removal bash script ([#71](https://github.com/cyb3rhq/cyb3rhq-api/pull/71)).
- New API request: `GET/agents/stats/distinct`. ([#115](https://github.com/cyb3rhq/cyb3rhq-api/pull/115))
- Installer option for disabling API service setup. ([#129](https://github.com/cyb3rhq/cyb3rhq-api/pull/129))


### Changed
- Move "Multiple DB requests" to `/experimental`. ([#124](https://github.com/cyb3rhq/cyb3rhq-api/pull/124))

### Fixed
- Fixed `purge` filter in `DELETE/agents` ([#122](https://github.com/cyb3rhq/cyb3rhq-api/pull/122))


## [v3.3.1]
### Changed
- Output of `DELETE/agents`: Added attributes `total_affected_agents` and `total_failed_ids`. ([Cyb3rhq #795](https://github.com/cyb3rhq/cyb3rhq/pull/795))

### Fixed
- Fixed `configure_api` tries to remove `preloaded_vars` even if it doesn't exist. ([#106](https://github.com/cyb3rhq/cyb3rhq-api/pull/106))
- Fixed crash for requests with wrong headers. ([#107](https://github.com/cyb3rhq/cyb3rhq-api/pull/107))


## [v3.3.0]
### Added
- Filter by group in `GET/agents` API call. ([#97](https://github.com/cyb3rhq/cyb3rhq-api/pull/97))
- Filter by status in `GET/agents/groups/:group_id` and `GET/agents/no_group` API calls. ([#97](https://github.com/cyb3rhq/cyb3rhq-api/pull/97))
- Sort by `lastKeepAlive` in `GET/agents` API call. ([#97](https://github.com/cyb3rhq/cyb3rhq-api/pull/97))

### Changed
- Modified `limit` parameter to retrieve all items using `limit=0`. Available in all requests that return lists. ([#96](https://github.com/cyb3rhq/cyb3rhq-api/pull/96))

### Fixed
- Fixed bug that limited the number of agents deleted by `DELETE/agents` to a maximum of 500. ([Cyb3rhq #740](https://github.com/cyb3rhq/cyb3rhq/pull/740))
- Fixed error message when an invalid character was used with `select` parameter ([#98](https://github.com/cyb3rhq/cyb3rhq-api/pull/98)).


## [v3.2.4]

There are no changes for Cyb3rhq API in this version.


## [v3.2.3]
### Added

- New API requests:
    * `GET/rules/gdpr` ([#78](https://github.com/cyb3rhq/cyb3rhq-api/pull/78)).
    * `GET/agents/no_group`.
    * `GET/cluster/healthcheck`.
    * `GET/cluster/nodes/:node_name`.
- A parameter in request `GET/rules` to filter by GDPR requirements ([#78](https://github.com/cyb3rhq/cyb3rhq-api/pull/78)).
- Parameters in `GET/cluster/nodes`: `search`, `sort`, `offset`, `limit`, `select`. And a new filter: `type`.
- Parameters in request `GET/agents`:
    * `node_name`: Filters agents by cluster nodes.
    - `older_than`: Filters by agents not connected in a specific time ([#82](https://github.com/cyb3rhq/cyb3rhq-api/pull/82)).
    - `status`: Filters agents with a specific status ([#82](https://github.com/cyb3rhq/cyb3rhq-api/pull/82)).
- New filters in request `DELETE/agents`:
    - `older_than`: Filters by agents not connected in a specific time ([#82](https://github.com/cyb3rhq/cyb3rhq-api/pull/82)).
    - `status`: Filters agents with a specific status ([#82](https://github.com/cyb3rhq/cyb3rhq-api/pull/82)).

### Changed
- Output of `GET/nodes`: Added new attribute `version`.
- Output of `DELETE/agents`: Added new attribute `older_than`.
- Filter `status` in `GET/agents` can filter by several status separated by commas ([#82](https://github.com/cyb3rhq/cyb3rhq-api/pull/82)).

### Removed
- The following requests have been removed:
    - `GET/cluster/agents`: Duplicated request (`GET/agents`).
    - `GET/cluster/node`: Duplicated request (`GET/cluster/config`).
    - `GET/cluster/files`: It will not be available in this version of the cluster.
    - `POST/agents/purge`: Replaced by `DELETE/agents` ([#82](https://github.com/cyb3rhq/cyb3rhq-api/pull/82)).
    - `GET/agents/purgeable`: Replaced by `GET/agents` ([#82](https://github.com/cyb3rhq/cyb3rhq-api/pull/82)).

## [v3.2.2]
### Added
- Added an option in `config.js` to run the API with root privileges for debug purposes and troubleshooting. The API runs as ossec by default. ([#68](https://github.com/cyb3rhq/cyb3rhq-api/pull/68))
### Changed
- Changed mode from 750 to 660 in `/configuration/auth/user` file after installing it.


## [v3.2.1]

There are no changes for Cyb3rhq API in this version.


## [v3.2.0]
### Added
- Version selector added to `GET /agents` ([#60](https://github.com/cyb3rhq/cyb3rhq-api/pull/60)).
- It's possible search agents by version in `GET /agents` ([#60](https://github.com/cyb3rhq/cyb3rhq-api/pull/60)).
- New attributes added to the output of `GET /agents` ([Cyb3rhq #375](https://github.com/cyb3rhq/cyb3rhq/pull/375)).

### Fixed
- Fixed `ìnstall_api.sh` script to load preloaded_vars.conf ([#53](https://github.com/cyb3rhq/cyb3rhq-api/pull/53)).
- Fixed `api-register-agent.sh` script ([#56](https://github.com/cyb3rhq/cyb3rhq-api/pull/56)).
- Fixed bad assigment of agent attributes (`mergedSum` and `configSum`) ([Cyb3rhq #372](https://github.com/cyb3rhq/cyb3rhq/pull/372)).

### Changed
- Change output of `GET/manager/info` ([Cyb3rhq #371](https://github.com/cyb3rhq/cyb3rhq/pull/371)).
- Change timestamp format of ossec logs (affected calls output: `GET /manager/logs` and `GET /manager/summary`) ([Cyb3rhq #355](https://github.com/cyb3rhq/cyb3rhq/pull/355)).

## [v3.1.0]
### Added

- [Option for agent deletion to purge agents definitely from keystore.](https://github.com/cyb3rhq/cyb3rhq-api/pull/41)
- [New option in config.js to force the use of authd.](https://github.com/cyb3rhq/cyb3rhq-api/pull/43).
- [New request: Get agent information by agent name - `GET/agents/name/:agent_name`](https://github.com/cyb3rhq/cyb3rhq-api/pull/42)
- [New request: purge never connected or disconnected more than :timeframe time agents - `POST/agents/purge`](https://github.com/cyb3rhq/cyb3rhq-api/pull/40)
- [New request: get purgeable agents - `GET/agents/purgeable/:timeframe`](https://github.com/cyb3rhq/cyb3rhq-api/pull/40)

### Changed

- [Changed the SSL certificate key size from 1024 bits to 2048 bits.](https://github.com/cyb3rhq/cyb3rhq-api/pull/45)
- [Return `key` when inserting new agents.](https://github.com/cyb3rhq/cyb3rhq/pull/303).

### Fixed

- [Use special characters as user/password in configure_api.sh.](https://github.com/cyb3rhq/cyb3rhq-api/pull/46)
- [Wrong field returned by `GET/agents/:agent_id/key`](https://github.com/cyb3rhq/cyb3rhq/commit/24a5a04ccff80c26e7a5b592514ca7fcd8a3a026).
- [Race condition when doing massive requests to the API call of inserting agents](https://github.com/cyb3rhq/cyb3rhq/pull/306).


### Removed

- [Do not create HTTP user "cyb3rhq" automatically, it's no longer necessary.](https://github.com/cyb3rhq/cyb3rhq-api/pull/45)


## [v3.0.0]
### Added
- Parameter in config.js file to configure the SSL version to use in the API.
- Add requests to manage groups.
    - Get basic information about all groups: `GET/agents/groups`
    - Get the agents of `:group_id` group: `GET/agents/groups/:group_id`
    - Get `:group_id`'s shared configuration: `GET/agents/groups/:group_id/configuration`
    - Get `:group_id`'s files: `GET/agents/groups/:group_id/files`
    - Get `:filename` file of `:group_id` group: `GET/agents/groups/:group_id/files/:filename`
    - Set `:agent_id` agent to group `:group_id`: `PUT/agents/:agent_id/group/:group_id`
    - Create the `:group_id` group: `PUT/agents/groups/:group_id`
    - Remove `:group_id` group: `DELETE/agents/groups/:group_id`
    - Unset `:agent_id`'s group: `DELETE/agents/groups/:group_id`
- Unattended install and configure mode using `preloaded_vars.conf`.
- Add `timestamp` field at index query.
- Improve output of delete and restart agents requests: each ID includes error information.
- Add requests to manage remote agent upgrades.
- Add requests to manage cluster:
    - Get information about the actual manager node in the cluster - `GET/cluster/node`
    - Get information about  all nodes in the cluster - `GET/cluster/nodes`
    - Get information about the status of the synchronized files in the cluster - `GET/cluster/files`
    - Get information about the agents in the cluster - `GET/cluster/agents`
    - Get the cluster status (enabled or disabled) - `GET/cluster/status`
    - Get the cluster configuration - `GET/cluster/config`
- Add a selector for the API call to retrieve information about an agent using its ID.

### Fixed
- When adding a new agent, now it checks that its name is different than manager's name.
- Bug in XML parser of rules, decoders and configuration.

### Changed
- Change output format of `GET/manager/logs` call to JSON.

## [v2.1.1]
### Fixed
- Issue issue when deleting and restarting a list of agents
- Issue with socket comunication in authd.

## [v2.1.0]
### Added
- Added OS information to `GET /agent` request
- New request: Delete a list of agents - `DELETE /agents - Params: {"ids":["id_1", ..., "id_n"]}`
- New request: Restart a list of agents - `POST /agents/restart - Params: {"ids":["id_1", ..., "id_n"]}`

### Changed
- Support add/remove agents with ossec-authd running


## [v2.0.1] - 2017-07-25
### Fixed
- Issue when basic-auth is disabled.
- Regex for latest version in install_api.sh
- Wrong scan dates for syscheck and rootcheck.
- IP value always must be lowercase.

## [v2.0.0] - 2017-04-24
### Added
- **Cyb3rhq v2.0** is required to run the API.
- API must be launched with root user, but it is run with ossec user.
- Scripts:
    - install_api.sh
    - configure_api.sh
- Parameters:
    - Pretty JSON (?pretty)
    - Pagination: offset & limit
    - Search
    - Sort
- Requests:
    - Agents
      - GET /agents/summary (Get agents summary)
      - PUT /agents/restart (Restart all agents)
      - POST /agents/insert (Insert agent)
    - Manager
      - GET /manager/info (Get manager information)
      - GET /manager/logs (Get ossec.log)
      - GET /manager/logs/summary (Get summary of ossec.log)
 - Decoders
    - GET /decoders (Get all decoders)
    - GET /decoders/:decoder_name (Get decoders by name)
    - GET /decoders/files (Get all decoders files)
    - GET /decoders/parents (Get all parent decoders)
 - Rules
    - GET /rules (Get all rules)
    - GET /rules (Get rules by id)
    - GET /rules/files (Get files of rules)
    - GET /rules/groups (Get rule groups)
    - GET /rules/pci (Get rule pci requirements)
 - Rootcheck
    - GET /rootcheck/:agent_id/cis (Get rootcheck CIS requirements)
    - GET /rootcheck/:agent_id/pci (Get rootcheck pci requirements)
 - API
    - GET /version

- Cyb3rhq framework: Manage Cyb3rhq from python.
- Unit tests
- Cache (750ms) for GET requests

### Changed
- Improved API service.
- Improved input validation.
- Improved Error Handling.
- Improved logging.
- Settings in /api/configuration.
- By default, API is installed using HTTP.
- xmljson is not necessary.
- apache-utils is not necessary.
- Requests:
 - Improved:
  - GET /rootcheck/:agent_id (Get rootcheck database)
  - GET /syscheck/:agent_id (Get syscheck files)

### Removed
- Requests that require root privileges:
 - /manager/configuration/test
 - /manager/start,stop,restart


## [v1.2.1] - 2016-07-25
### Fixed
- Issue installing API as service.


## [v1.2] - 2016-04-13
### Added
- Run API as service
- API Versioning
- Improved error handling
- Improved Cross-origin resource sharing (CORS)
- Automatic agent IP address registration
- Improved proxy server IP source extraction

### Changed
- NodeJS modules must be installed with *npm install*
- Response JSON: Field *response* changed to *data*.

### Fixed
- Problem importing xmljson package in Python
- Wrong HTTP Status Code in some specific cases


## [v1.1] - 2016-02-24
### Added
- Agents
 - DELETE /agents/:agent_id
 - POST /agents
 - PUT /agents/:agent_id/restart
 - PUT /agents/:agent_name

- Manager
 - GET /manager/configuration
 - GET /manager/configuration/test
 - GET /manager/stats
 - GET /manager/stats/hourly
 - GET /manager/stats/weekly
 - GET /manager/status
 - PUT /manager/restart
 - PUT /manager/start
 - PUT /manager/stop

- Rootcheck
 - DELETE /rootcheck
 - DELETE /rootcheck/:agent_id
 - GET /rootcheck/:agent_id
 - GET /rootcheck/:agent_id/last_scan
 - PUT /rootcheck
 - PUT /rootcheck/:agent_id

- Syscheck
 - DELETE /syscheck
 - DELETE /syscheck/:agent_id
 - GET /syscheck/:agent_id/files/changed
 - GET /syscheck/:agent_id/last_scan
 - PUT /syscheck
 - PUT /syscheck/:agent_id


### Changed
- Directory structure
- HTTP verbs for *agents* resource.
- Requests */agents/sysrootcheck* have been split:
 - /syscheck
 - /rootcheck


## [v1.0] - 2015-11-08
- Inital version
