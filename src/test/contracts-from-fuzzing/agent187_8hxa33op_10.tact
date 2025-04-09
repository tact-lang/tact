struct InnerDefault {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsInStruct {
    val: InnerDefault;

    init() {
        self.val = InnerDefault{};
    }
}
