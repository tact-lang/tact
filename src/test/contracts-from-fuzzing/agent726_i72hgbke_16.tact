struct A {
    x: Int;
    y: Bool;
}

struct B {
    m: A;
    n: String;
}

struct C {
    p: B;
    q: Int;
}

contract StructChain {
    root: C;

    init() {
        self.root = C{
            p: B{
                m: A{ x: 1, y: true },
                n: "hi",
            },
            q: 2,
        };
    }

    receive() {
        self.root = self.root;
    }
}