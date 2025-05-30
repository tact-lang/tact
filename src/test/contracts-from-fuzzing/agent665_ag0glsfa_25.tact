struct InnerA { val: Int; }
struct InnerB { str: String; }

struct Outer {
    a: InnerA;
    b: InnerB;
}

contract MultiNested {
    f: Outer = Outer{
        a: InnerA{val:1},
        b: InnerB{str:"s"}
    };

    init() {
        self.f = self.f;
    }

    receive() {
        let _ = self.f;
    }
}