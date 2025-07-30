struct Test {
    a: Int as int4;
    b: Int as uint252;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract SerializationEdge {
    data: Test;

    init() {
        self.data = Test{
            a: -4,
            b: 100,
            c: true,
            d: null,
            e: "serialize",
            f: null
        };
    }
}