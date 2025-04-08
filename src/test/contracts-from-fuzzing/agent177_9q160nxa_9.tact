struct S {
    a: Int;
    b: Int?;
}

contract NestedOptStruct {
    s: S?;
    init() {
        self.s = S{
            a: 1,
            b: null
        };
    }
}