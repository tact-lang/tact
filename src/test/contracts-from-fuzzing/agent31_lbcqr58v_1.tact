struct DeepNested {
    x: Int;
    y: Int?;
    z: Inner;
}

struct Inner {
    a: Int;
    b: Int?;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            x: 1,
            y: null,
            z: Inner{
                a: 2,
                b: null
            }
        };
    }
}