struct S {
    x: Int as uint4;
}

contract SerializeFailStruct {
    s: S;
    init() {
        self.s = S{ x:31 };
    }
}