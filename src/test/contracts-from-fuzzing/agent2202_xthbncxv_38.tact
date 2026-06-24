struct S {
    a: Int as uint3;
    b: Int as uint6;
}

contract OverflowInStruct {
    s: S;

    init() {
        self.s = S{
            a: 10, // over max 7
            b: 64, // over max 63
        };
    }
}