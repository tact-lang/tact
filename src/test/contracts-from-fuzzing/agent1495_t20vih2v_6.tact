struct NestedOpt {
    value: Int?;
    flag: Bool;
}

contract OptionKeeper {
    x: NestedOpt;

    init() {
        self.x = NestedOpt{ value: null, flag: true };
    }
}