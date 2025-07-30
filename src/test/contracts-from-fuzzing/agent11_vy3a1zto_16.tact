message BigMsg {
    a: Int as uint128;
    b: Int as uint128;
}

contract TestBigBounced {
    bounced(msg: bounced<BigMsg>) {
        // no access needed, just test if the size limit error produces a compile error
    }
}
