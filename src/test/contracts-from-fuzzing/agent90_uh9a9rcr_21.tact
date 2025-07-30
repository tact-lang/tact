struct SimpleOption {
    x: Int?;
}

struct HasSimple {
    s: SimpleOption;
}

contract OptionStructInStruct {
    data: HasSimple;
    init() {
        self.data = HasSimple{ s: SimpleOption{ x: null } };
    }
}