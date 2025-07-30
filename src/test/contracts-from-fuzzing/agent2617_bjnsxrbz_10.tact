struct Defaulted {
    a: Int = 5;
    b: String = "hello";
    c: Bool = true;
}

contract StructDefaults {
    item: Defaulted;
    init() {
        self.item = Defaulted{};
    }
}