message MyMsg {
    a: Int;
}

contract TestReceiverUnderscoreTyped {
    receive(_: MyMsg) {
        // receiver for typed binary messages using underscore parameter
    }
}
