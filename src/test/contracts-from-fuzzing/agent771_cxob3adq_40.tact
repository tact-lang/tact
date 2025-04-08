struct S1 { foo: Int; }
struct S2 { bar: S1; }

contract Mix {
    a: S2 = S2{ bar: S1{ foo: 88 } };
    b: Int = 99;

    init() {
        self.a = S2{ bar: S1{ foo: 77 } };
        self.b = 66;
    }
}