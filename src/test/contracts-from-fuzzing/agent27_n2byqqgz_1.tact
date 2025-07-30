message MyBounce {
    x: Int;
}

contract TestBounce {
    bounced(msg: bounced<MyBounce>) {
        // valid bounce receiver using a bounced message type
    }
}
