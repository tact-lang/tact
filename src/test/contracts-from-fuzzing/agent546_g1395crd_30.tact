struct OptionalDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract OptDefaults {
    o: OptionalDefaults;

    init() {
        self.o = OptionalDefaults{ a:null, b:null, c:null };
    }
}