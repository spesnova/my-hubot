# My Hubot

## Installation
### Setup

```
$ git clone https://github.com/spesnova/my-hubot.git && cd my-hubot
$ script/bootstrap
```

### Starting It Up

```
$ script/start
```

specifying adapter to use.

```
$ script/start hipchat
```

### Configuring Your Hubot
Modify `.env`, if you need to set environment variables.

```
#
# HipChat
#
export HUBOT_HIPCHAT_JID="sample_jid"
export HUBOT_HIPCHAT_PASSWORD="sample_password"
export HUBOT_HIPCHAT_ROOMS="sample_rooms"
export HUBOT_HIPCHAT_TOKEN="sample_token"
```

