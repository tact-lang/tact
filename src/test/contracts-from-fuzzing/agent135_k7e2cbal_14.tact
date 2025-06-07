message MyMsg {
    value: Int;
}

contract TestBounced {
    // bounced message receiver for typed binary message
    bounced(msg: bounced<MyMsg>) {}
}
