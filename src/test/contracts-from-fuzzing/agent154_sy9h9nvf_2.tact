struct DeepNested {
    x: Int;
    y: Bool;
}

struct Middle {
    nested: DeepNested;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    number: Int;
}

contract NestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                nested: DeepNested{
                    x: 42,
                    y: false,
                },
                flag: true,
            },
            number: 99,
        };
    }
}