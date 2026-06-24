struct DeepDefault {
    a: Int = 99;
    b: Bool = true;
    c: String = "deep";
}

contract DefaultsInStructNested {
    val: DeepDefault;

    init() {
        self.val = DeepDefault{};
    }
}
