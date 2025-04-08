struct InnerA { val: Int; }
struct InnerB { str: String; }

struct Container {
    a: InnerA;
    b: InnerB;
    optInner: InnerA?;
    optStr: String?;
}

contract NestedWithOptionals {
    state: Container;

    init() {
        self.state = Container{
            a: InnerA{ val: 1 },
            b: InnerB{ str: "bla" },
            optInner: null,
            optStr: null
        };
    }
}