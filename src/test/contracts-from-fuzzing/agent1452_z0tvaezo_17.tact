struct HasBoolDefault {
    flag: Bool = true;
}

contract BoolDefaultStruct {
    val: HasBoolDefault;

    init() {
        self.val = HasBoolDefault{};
    }
}