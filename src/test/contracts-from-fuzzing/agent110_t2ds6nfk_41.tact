struct Nested {
    foo: Int?;
    flag: Bool;
}

struct Wrapper {
    nst: Nested?;
}

contract NullNestedOpt {
    data: Wrapper;
    init() {
        self.data = Wrapper{nst: null};
    }
}