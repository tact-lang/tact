message TestMessage {
    value: Int;
}

contract BounceTest {
    bounced(msg: bounced<TestMessage>) {
         self.reply("bounced".asComment());
    }
}
