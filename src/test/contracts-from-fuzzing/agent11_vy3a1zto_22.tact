message BigMsg2 {
    a: Int as uint128;
    b: Int as uint128;
}

contract TestAccessBigField {
    bounced(msg: bounced<BigMsg2>) {
         let x: Int = msg.a;
    }
}
