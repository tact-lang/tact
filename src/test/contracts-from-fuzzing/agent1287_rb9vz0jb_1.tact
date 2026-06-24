struct DeepNested {
    x: Int;
    y: Bool;
}

struct Outer {
    one: DeepNested;
    two: DeepNested;
    flag: Bool;
}

contract TestContract {
    config: Outer;

    init() {
        self.config = Outer{
            one: DeepNested{ x: 1, y: true },
            two: DeepNested{ x: 2, y: false },
            flag: true,
        };
    }
}