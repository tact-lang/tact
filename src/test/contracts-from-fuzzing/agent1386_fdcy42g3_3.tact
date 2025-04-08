struct S {
    i: Int;
    opt: Int?;
    nested: Nested;
}

struct Nested {
    flag: Bool;
}

contract ComplexStorage {
    myStruct: S;
    init() {
        self.myStruct = S { i: 7, opt: null, nested: Nested { flag: true } };
    }
}