struct ManyDefaults {
    a: Int = 1;
    b: String = "hello";
    c: Bool = false;
}

contract DefaultsStruct {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }
}