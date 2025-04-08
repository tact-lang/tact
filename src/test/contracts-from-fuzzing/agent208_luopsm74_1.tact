struct DeepNested {
    a: Int;
    b: NestedInner;
}

struct NestedInner {
    x: Int;
    y: NestedLeaf;
}

struct NestedLeaf {
    z: Bool;
    w: String;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 5,
            b: NestedInner{
                x: 10,
                y: NestedLeaf{
                    z: true,
                    w: "end"
                }
            }
        };
    }
}
