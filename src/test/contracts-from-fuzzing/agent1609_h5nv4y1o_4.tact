struct NestedOpt {
    value: Int?;
    flag: Bool?;
}

contract TestContract {
    nestedOpt: NestedOpt;

    init() {
        self.nestedOpt = NestedOpt{
            value: null,
            flag: true
        };
    }

    receive() {
        self.nestedOpt = NestedOpt{
            value: 123,
            flag: null
        };
    }
}