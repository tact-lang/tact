struct Bottom {
    x: Int;
}

struct Middle {
    b: Bottom;
    y: Bool;
}

struct TopLevel {
    mid: Middle;
    text: String;
}

contract OptionalDeepNested {
    storage: TopLevel?;

    init() {
        self.storage = TopLevel{
            mid: Middle{
                b: Bottom{ x: 132 },
                y: true
            },
            text: "deep"
        };
    }
}