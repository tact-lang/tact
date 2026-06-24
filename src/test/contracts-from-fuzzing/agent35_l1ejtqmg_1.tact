message MyBounced {
    value: Int;
}

contract BasicBounce {
    bounced(msg: bounced<MyBounced>) {
    }
}
