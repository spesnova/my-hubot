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
Modify `script/start`, if you need to set a configuration variable.

```
...
#
# Load environment variables.
#
echo "  + Loading environment varibales."
export HUBOT_AUTH_ADMIN="yourname"
export HUBOT_HIPCHAT_JID="sample_jid"
export HUBOT_HIPCHAT_PASSWORD="sample_password"
export HUBOT_HIPCHAT_ROOMS="sample_rooms"
export HUBOT_HIPCHAT_TOKEN="sample_token"
export HUBOT_LOG_LEVEL="debug"
...
```

