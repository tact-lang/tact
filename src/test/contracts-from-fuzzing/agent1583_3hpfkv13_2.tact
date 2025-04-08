struct DeepNested {
    a: Int;
    b: Bool;
    c: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 1,
            b: true,
            c: Inner{x: 5, y: false}
        };
    }
}