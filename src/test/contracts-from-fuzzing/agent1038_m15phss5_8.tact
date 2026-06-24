struct ManyDefaults2 {
    x: Int = 1;
    y: Bool = true;
    s: String = "abc";
}

contract DefaultsStruct2 {
    d: ManyDefaults2;
    init() {
        self.d = ManyDefaults2{};
    }
}