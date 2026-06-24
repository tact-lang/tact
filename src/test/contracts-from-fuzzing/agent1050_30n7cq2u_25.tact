// test serialization edge: small unsigned, then signed, then large unsigned
struct SerialEdge {
    a: Int as uint1;
    b: Int as int8;
    c: Int as uint128;
}

contract EdgeSerialize {
    val: SerialEdge;

    init() {
        self.val = SerialEdge{
            a:1, b:-5, c:340282366920938463463374607431768211455
        };
    }
}