struct NestedOpt {
    foo: Int?;
    bar: Bool;
}

contract MixedOptional {
    n1: NestedOpt?;
    n2: NestedOpt;

    init() {
        self.n1 = null;
        self.n2 = NestedOpt{foo: null, bar: true};
    }
}
