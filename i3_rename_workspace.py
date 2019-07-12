#!/usr/bin/env python

import json
import subprocess

json_blob = subprocess.Popen(['i3-msg', '-t', 'get_workspaces'],
    stdout=subprocess.PIPE).stdout.read()
all_workspaces = json.loads(json_blob)
focused_workspace = filter(lambda w: w['focused'], iter(all_workspaces))[0]['num']

cmd_str = "rename workspace to \"{}:%s\"".format(focused_workspace)

subprocess.Popen(['i3-input', '-F', cmd_str, '-P', 'New name for this workspace: '])
