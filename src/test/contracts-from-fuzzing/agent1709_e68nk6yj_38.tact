// test nested struct with serialization annotations
struct SAnn {
    a: Int as uint32;
    b: Int as int64;
    c: Bool;
    d: Address;
    e: String;
}

contract AnnotatedNested {
    s: SAnn;
    init() {
        self.s = SAnn{
            a: 1,
            b: -2,
            c: true,
            d: myAddress(),
            e: "abc",
        };
    }
}