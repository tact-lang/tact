struct Sub {
    subInt: Int;
}

struct Container {
    nested1: Sub;
    nested2: Sub;
}

contract DoubleNested {
    store: Container;

    init() {
        self.store = Container{
            nested1: Sub{ subInt: 11 },
            nested2: Sub{ subInt: 22 }
        };
    }
}