struct Defaulted {
    x: Int = 5;
    y: Bool = true;
    z: String = "default";
}

contract DefaultedFieldsTest {
    f: Defaulted;

    init() {
        self.f = Defaulted{};
    }
}