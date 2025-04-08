struct FieldDefaults {
    x: Int = 10;
    y: Bool = true;
    s: String = "ok";
}

contract Defaulted {
    f: FieldDefaults;

    init() {
        self.f = FieldDefaults{};
    }
}