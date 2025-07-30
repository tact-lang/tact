message MyMsg {
    value: Int;
}

contract Test {
    // Bounced receiver for typed message
    bounced(msg: bounced<MyMsg>) {
        // Handling bounced message of type MyMsg
    }
}
