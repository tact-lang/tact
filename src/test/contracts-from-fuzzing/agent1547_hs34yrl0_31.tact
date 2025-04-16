struct HasBoolDefaults {
    flag1: Bool = true;
    flag2: Bool;
}

contract BoolDefaults {
    data: HasBoolDefaults;

    init() {
        self.data = HasBoolDefaults{
            flag2: false
        };
    }
}