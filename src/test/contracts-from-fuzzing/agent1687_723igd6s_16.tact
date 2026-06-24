struct GrandChild {
    a: Int;
    b: Bool;
}

struct Child {
    x: GrandChild;
    y: Int;
}

struct Parent {
    c: Child;
    d: Int;
}

contract DeepChain {
    p: Parent;

    init() {
        self.p = Parent{
            c: Child{
                x: GrandChild{ a:10, b:true },
                y:7
            },
            d:5
        };
    }
}