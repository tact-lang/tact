struct Combo {
    a: Int;
    b: Bool?;
    c: Address;
}

contract ComboFields {
    foo: Combo;
    bar: Combo;

    init() {
        self.foo = Combo{ a: 10, b: true, c: myAddress() };
        self.bar = Combo{ a: 20, b: null, c: myAddress() };
    }
}