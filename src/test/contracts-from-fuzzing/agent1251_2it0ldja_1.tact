struct DeepNested {
    a: Int;
    b: Inner;
}

struct Inner {
    x: Int?;
    y: Leaf;
}

struct Leaf {
    val: Bool?;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 1,
            b: Inner{
                x: null,
                y: Leaf{
                    val: true
                }
            }
        };
    }
}
