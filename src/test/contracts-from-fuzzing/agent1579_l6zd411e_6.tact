struct NestedOptional {
    inn: Int?;
}

struct Outer {
    nested: NestedOptional?;
    b: Bool;
}

contract OptionNest {
    param: Outer;

    init() {
        self.param = Outer{nested: null, b: false};
    }

    receive() {
        self.param.nested = NestedOptional{inn: 10};
    }
}