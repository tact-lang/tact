struct S {
    a: Int as uint1;
    b: Int as uint2;
    c: Int as uint3;
    d: Int as uint4;
}

contract SerializationEdge {
    val: S;

    init() {
        self.val = S{
            a: 1, b:2, c:3, d:4
        };
    }
}