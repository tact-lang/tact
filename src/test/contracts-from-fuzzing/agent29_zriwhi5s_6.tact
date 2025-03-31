message Ping {
    a: Int;
}

contract BounceReply {
    bounced(msg: bounced<Ping>) {
        // In bounce receiver, attempt to reply as a test of recursive bounce behavior
        self.reply("Reply inside bounce handler".asComment());
    }
}
