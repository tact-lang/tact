message(123) BounceMsg {
    someVal: Int as uint8;
}

contract BounceTest {
    // Receiver for normal messages
    receive(msg: BounceMsg) {
         // In a normal message, simply echo the value
         dump(msg.someVal);
         cashback(sender());
    }

    // Bounced message receiver for messages that bounced back
    bounced(msg: bounced<BounceMsg>) {
         // Dump the value from the bounced message
         dump(msg.someVal);
    }

    // A getter function to check contract state (dummy)
    get fun dummy(): Int {
         return 42;
    }
}
