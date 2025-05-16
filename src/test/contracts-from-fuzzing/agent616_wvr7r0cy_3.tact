struct DeepNested {
    x: Int;
    y: Bool?;
}

struct Container {
    inner: DeepNested;
    s: String?;
}

contract DeepNestContract {
    stored: Container;

    init() {
        self.stored = Container{
            inner: DeepNested{
                x: 99,
                y: null
            },
            s: null
        };
    }
}