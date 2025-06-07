struct InnerStruct {
    s1: String;
    opt: Bool?;
}

contract OptionalStringCombo {
    item: InnerStruct;

    init() {
        self.item = InnerStruct{ s1: "Test", opt: null };
    }
}