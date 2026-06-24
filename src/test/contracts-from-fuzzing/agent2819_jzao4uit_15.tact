struct SLeaf {
    x: Int;
}

struct Branch1 {
    a: Int;
    b: SLeaf;
}

struct Branch2 {
    c: Int?;
    d: SLeaf;
}

struct Root {
    left: Branch1;
    right: Branch2;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            left: Branch1{
                a: 1,
                b: SLeaf{x:2}
            },
            right: Branch2{
                c: null,
                d: SLeaf{x:3}
            }
        };
    }
}