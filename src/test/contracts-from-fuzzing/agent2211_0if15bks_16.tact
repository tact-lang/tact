struct Defaulted {
    foo: Int = 5;
    bar: Bool = true;
    txt: String = "abc";
}

contract StructWithDefaultsField {
    defaulted: Defaulted;

    init() {
        self.defaulted = Defaulted{};
    }
}