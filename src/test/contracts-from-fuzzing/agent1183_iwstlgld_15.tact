struct S1 {
    a: Int as int4;
    b: Int as uint3;
    c: Bool;
    d: String;
}

contract SerialEdgeStruct {
    s: S1;

    init() {
        self.s = S1{
            a: -3,
            b: 5,
            c: true,
            d: "edge",
        };
    }
}