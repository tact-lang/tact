struct DeepNested {
    level1: Int;
    level2: Inner;
}

struct Inner {
    a: Bool;
    b: Leaf;
}

struct Leaf {
    s: String;
}

contract DeepNestedContract {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            level1: 1,
            level2: Inner{
                a: true,
                b: Leaf{
                    s: "done"
                }
            }
        };
    }
}