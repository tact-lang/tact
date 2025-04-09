// test many nested structs with mixed default/no default fields
struct A {
    x: Int;
    y: Bool = false;
}

struct B {
    a: A;
    s: String = "";
}

struct C {
    b: B;
    optInt: Int?;
}

contract Test {
    f: C;

    init() {
        self.f = C{
            b: B{ a: A{ x:42, y:true }, s:"ok" },
            optInt: null
        };
    }
}
