struct DefaultsNested {
    val: Int = 5;
    opt: Bool?; // implicitly null
}

contract DefaultStructField {
    s: DefaultsNested;

    init() {
        self.s = DefaultsNested{};
    }
}