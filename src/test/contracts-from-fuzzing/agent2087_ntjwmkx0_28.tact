struct OptionBool {
    v: Bool?;
}

contract OptionalBoolStruct {
    data: OptionBool;

    init() {
        self.data = OptionBool{v: null};
    }
}