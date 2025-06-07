struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "bar";
}

contract DefaultsInStruct {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}
