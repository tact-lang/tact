struct StringDefault {
    name: String = "Default";
    val: Int;
}

contract StringDefaults {
    s: StringDefault;
    init() {
        self.s = StringDefault{ val: 42 };
    }
}