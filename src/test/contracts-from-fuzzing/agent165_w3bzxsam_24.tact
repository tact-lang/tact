struct Wrapped {
    id: Int;
}

contract WithDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "foo";
    d: Wrapped = Wrapped{ id: 1 };

    init() {
        self.a = 7;
        self.b = false;
        self.c = "bar";
        self.d = Wrapped{ id: 99 };
    }
}