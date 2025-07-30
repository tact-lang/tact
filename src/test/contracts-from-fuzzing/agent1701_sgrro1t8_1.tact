struct DeepNested {
    a: Int;
    b: Int?;
    c: NestedInner;
}

struct NestedInner {
    x: Int;
    y: Int?;
}

contract TestContract {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            a: 1,
            b: null,
            c: NestedInner{
                x: 2,
                y: null
            }
        };
    }
}