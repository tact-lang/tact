struct DeepNested {
    x: Int;
    y: Bool;
}

struct Outer {
    nested: DeepNested;
    flag: Bool?;
    text: String;
}

contract TestDeep {
    param: Outer;

    init() {
        self.param = Outer{
            nested: DeepNested{ x: 100, y: false },
            flag: null,
            text: "Hello"
        };
    }
}