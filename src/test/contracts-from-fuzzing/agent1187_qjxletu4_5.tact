struct Mixed {
    a: Int = 7;
    b: Bool?;
    c: String = "test";
    d: Address?;
}

contract ComplexDefaults {
    data: Mixed = Mixed{ b: null, d: null };

    init() {
        self.data = Mixed{ a: 42, b: true, c: "hello", d: myAddress() };
    }
}