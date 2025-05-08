struct NestedOpt {
    foo: Int?;
    bar: Bool;
}

contract OptStructOptField {
    stOpt: NestedOpt?;

    init() {
        self.stOpt = NestedOpt{ foo: null, bar: true };
    }
}