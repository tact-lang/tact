struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract OptionalsInStructs {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct{ inner: null };
    }
}