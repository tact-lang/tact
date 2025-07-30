struct HasBool {
    flag: Bool;
}

struct OptionBoolStruct {
    maybe: HasBool?;
}

contract OptBoolCtr {
    v: OptionBoolStruct;

    init() {
        self.v = OptionBoolStruct{ maybe: null };
    }
}