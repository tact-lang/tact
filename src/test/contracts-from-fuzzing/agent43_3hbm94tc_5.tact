/* Test 5: Bounce receiver calling self.reply within the bounce handler */

message MsgA {
    v: Int;
}

contract BounceReply {
    bounced(msg: bounced<MsgA>) {
         self.reply("Replying to bounce".asComment());
    }
}
