struct OptionInStruct {
    x: Int;
    optStruct: Inner?;
}

struct Inner {
    f: Bool;
    y: Int;
}

contract OptNestedInside {
    storage: OptionInStruct;

    init() {
        self.storage = OptionInStruct{
            x: 9,
            optStruct: Inner{
                f: true,
                y: 42,
            },
        };
    }
}
