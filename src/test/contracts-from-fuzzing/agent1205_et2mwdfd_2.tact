struct DeepNested {
    x: Int;
    y: Bool?;
}

struct Outer {
    d1: DeepNested;
    d2: DeepNested;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            d1: DeepNested{x: 1, y: null},
            d2: DeepNested{x: 2, y: true},
        };
    }
}