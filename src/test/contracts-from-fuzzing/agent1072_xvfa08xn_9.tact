struct Defaulted {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsInStruct {
    v: Defaulted;

    init() {
        self.v = Defaulted{};
    }
}