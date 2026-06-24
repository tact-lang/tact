struct A {
    x: Int;
    y: Int?;
}

struct B {
    p: A;
    q: Int;
}

contract UnorderedOptionals {
    data: B;

    init() {
        self.data = B {
            p: A {
                x: 1,
                y: null
            },
            q: 2
        };
    }
}
