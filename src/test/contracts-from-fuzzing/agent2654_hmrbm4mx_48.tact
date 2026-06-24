struct S {
    f: Int;
}

contract ReassignNestedStruct {
    val: S;

    init() {
        self.val = S{f: 1};
        self.val = S{f: 2};
    }
}