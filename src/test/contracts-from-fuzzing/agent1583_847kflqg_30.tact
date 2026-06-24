struct Defaulted {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsInStruct {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}