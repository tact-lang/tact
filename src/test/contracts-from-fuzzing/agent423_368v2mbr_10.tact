struct S {
    v: Int?;
}

contract NestedOptionalInStruct {
    s: S;
    init() {
        self.s = S{ v: null };
    }
}