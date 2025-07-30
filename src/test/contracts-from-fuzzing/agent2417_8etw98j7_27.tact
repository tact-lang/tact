struct MidOptOpt {
    first: Int?;
    second: Int?;
}

contract NestedOptionals {
    nested: MidOptOpt?;

    init() {
        self.nested = MidOptOpt{ first: null, second: 2 };
    }
}
