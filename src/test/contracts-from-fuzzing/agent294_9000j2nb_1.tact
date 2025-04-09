struct BasicNested {
    innerField: Int;
}

contract NestedInContract {
    nestedField: BasicNested = BasicNested{innerField: 123};

    init() {
        self.nestedField = BasicNested{innerField: 456};
    }
}