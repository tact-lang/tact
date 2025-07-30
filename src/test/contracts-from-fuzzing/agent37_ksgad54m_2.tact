message MyMessage { val: Int as uint16 }

contract BounceTest2 {
    intResult: Int = 0;

    bounced(msg: bounced<MyMessage>) {
         self.intResult = msg.val;
    }

    receive() {
         self.reply("OK".asComment());
    }
}
