struct DeeplyNested {
    x: Int;
    y: Bool;
}

struct Middle {
    nested: DeeplyNested;
    z: String;
}

contract Test {
    m: Middle;

    init() {
        self.m = Middle{
            nested: DeeplyNested{
                x: 5,
                y: true
            },
            z: "deep"
        };
    }
}