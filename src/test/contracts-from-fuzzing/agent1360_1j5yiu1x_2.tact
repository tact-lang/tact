struct DeepNested {
    a: Int;
    b: Inner;
}

struct Inner {
    c: Int?;
    d: Leaf;
}

struct Leaf {
    e: Int;
    f: Bool?;
}

contract TestContract {
    tree: DeepNested;

    init() {
        self.tree = DeepNested{
            a: 10,
            b: Inner{
                c: null,
                d: Leaf{
                    e: 20,
                    f: true
                }
            }
        };
    }
}