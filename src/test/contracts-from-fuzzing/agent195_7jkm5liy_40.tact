struct DefaultsS {
    a: Int = 7;
    b: Bool = false;
    s: String = "hello";
    o: Int?; // implicit null default
}

contract StructDefault {
    nested: DefaultsS;

    init() {
        self.nested = DefaultsS{};
    }
}
