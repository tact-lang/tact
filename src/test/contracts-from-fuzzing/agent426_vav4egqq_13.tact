struct SNested {
    a: Int;
    b: Bool;
}

struct Container {
    nested1: SNested;
    nested2: SNested;
    nested3: SNested;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container{
            nested1: SNested{ a: 1, b: true },
            nested2: SNested{ a: 2, b: false },
            nested3: SNested{ a: 3, b: true },
        };
    }
}