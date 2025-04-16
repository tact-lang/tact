struct DeepNested {
    nested1: Inner;
    nested2: Outer;
}

struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: String;
    y: Int?;
    z: Bool;
}

contract TestContract {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            nested1: Inner{ a: 5, b: false },
            nested2: Outer{ x: "abc", y: null, z: true }
        };
    }
}