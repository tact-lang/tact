struct OptionalDefaults {
    a: Int? = 1;
    b: Bool? = false;
    c: String? = "hey";
}

contract StructWithDefaults {
    dat: OptionalDefaults;

    init() {
        self.dat = OptionalDefaults {};
    }
}