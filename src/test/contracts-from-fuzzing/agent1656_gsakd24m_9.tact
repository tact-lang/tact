struct A {
    x: Int;
    y: Bool;
}

struct B {
    nested: A;
    z: String;
}

struct C {
    nestedB: B;
    f: Int;
}

contract DeepChain {
    item: C;

    init() {
        self.item = C {
            nestedB: B{
                nested: A{
                    x: 7,
                    y: false
                },
                z: "hi"
            },
            f: 999
        };
    }
}