struct InnerDefault {
    a: Int = 1;
    b: Bool = true;
}

contract DefaultsInStruct {
    s: InnerDefault;

    init() {
        self.s = InnerDefault{};
    }
}