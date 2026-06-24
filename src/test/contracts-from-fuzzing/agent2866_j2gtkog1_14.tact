struct Sub {
    a: Int;
    b: Int;
}

struct Root {
    s1: Sub;
    s2: Sub;
}

contract InitOrder {
    root: Root;

    init() {
        self.root = Root{
            s1: Sub{a:1,b:2},
            s2: Sub{a:3,b:4}
        };
    }

    receive() {}
}