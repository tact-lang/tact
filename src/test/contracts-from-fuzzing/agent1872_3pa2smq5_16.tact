struct DefaultsNested {
    a: Int = 1;
    b: Bool = false;
    s: String = "hello";
}

contract DefaultsInStruct {
    val: DefaultsNested;

    init() {
        self.val = DefaultsNested{};
    }
}