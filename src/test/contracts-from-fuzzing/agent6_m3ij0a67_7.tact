message BounceMsgSmall { data: Int; }

contract BounceTestSmall {
    bounced(msg: bounced<BounceMsgSmall>) {
        // Do not access msg.data to avoid size limitation access
        self.reply("Bounced!".asComment());
    }
}
