struct NestedOptional {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract TestNested {
    opt: NestedOptional;

    init() {
        self.opt = NestedOptional{ a: 1, b: null, c: 3 };
    }
}