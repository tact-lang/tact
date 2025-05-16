struct EmptyDefaults {
    intField: Int;
    strField: String;
    boolField: Bool;
}

contract DefaultsStructStore {
    val: EmptyDefaults;
    init() {
        self.val = EmptyDefaults{
            intField: 0,
            strField: "",
            boolField: false
        };
    }
}