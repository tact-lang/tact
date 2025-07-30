struct NestedOpt {
    nested: Int?;
    flag: Bool;
}

struct HasNestedOpt {
    nestedOpt: NestedOpt?;
    value: Int;
}

contract NestedOptionals {
    data: HasNestedOpt;

    init() {
        self.data = HasNestedOpt{
            nestedOpt: NestedOpt{ nested: null, flag: true },
            value: 55
        };
    }
}