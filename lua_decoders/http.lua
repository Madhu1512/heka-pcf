local l = require "lpeg"
l.locale(l)
local clf = require "common_log_format"

local msg = {
    Timestamp   = nil,
    Type        = msg_type,
    Payload     = nil,
    Fields      = nil
}

function process_message ()

   local fields = {}
   local useragent = read_message("Fields[UserAgent]")
   if useragent then
                fields.user_agent_browser,
                fields.user_agent_version,
                fields.user_agent_os = clf.normalize_user_agent(useragent)
   end
   msg.Fields = fields
    inject_message(msg)
    return 0
end
