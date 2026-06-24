struct A { v: Int; }
struct B { v: Bool; }
struct C { v: String; }
struct D { v: Address; }
struct E { v: Cell; }

contract ManyNestedStructFields {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;

    init() {
        self.a = A{ v: 10 };
        self.b = B{ v: false };
        self.c = C{ v: "ok" };
        self.d = D{ v: myAddress() };
        self.e = E{ v: emptyCell() };
    }
}
