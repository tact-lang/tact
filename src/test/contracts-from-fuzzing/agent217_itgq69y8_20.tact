struct A { x: Int; }
struct B { y: Bool; }
struct C { z: String; }
struct D { w: Int; }

struct WideNested {
    a: A;
    b: B;
    c: C;
    d: D;
}

contract WideNestedContract {
    store: WideNested;

    init() {
        self.store = WideNested{
            a: A{x: 1},
            b: B{y: true},
            c: C{z: "ok"},
            d: D{w: 42}
        };
    }
}