struct ManyDefaultsStruct {
    a: Int = 99;
    b: Bool = false;
    c: String = "x";
}
contract DefaultsInStruct {
    s: ManyDefaultsStruct;
    init() {
        self.s = ManyDefaultsStruct{};
    }
}