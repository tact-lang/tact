struct S {
    f1: Int?;
    f2: String;
}

contract NestedOptInStruct {
    s: S?;

    init() {
        self.s = null;
    }
}