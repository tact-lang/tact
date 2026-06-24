struct DefaultsNested {
    a: Int = 5;
    b: Bool = true;
    s: String = "abc";
}

contract DefaultStructField {
    val: DefaultsNested;

    init() {
        self.val = DefaultsNested{};
    }
}