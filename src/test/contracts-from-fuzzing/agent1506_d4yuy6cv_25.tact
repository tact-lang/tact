struct A { i: Int; }
struct B { s: String; }
struct C { b: Bool; }

contract ManyNested {
    a: A;
    b: B;
    c: C;
    oa: A?;
    ob: B?;
    oc: C?;
    init() {
        self.a = A{i:1};
        self.b = B{s:"s"};
        self.c = C{b:true};
        self.oa = null;
        self.ob = B{s:"x"};
        self.oc = null;
    }
}
// test distinct structs and optional-wrapped variants all together as storage