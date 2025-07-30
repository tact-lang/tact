struct InnerMost {
    z: String;
}

struct Mid {
    y: InnerMost;
    opt: Int?;
}

struct Top {
    x: Mid;
}

contract DeepNested {
    value: Top;

    init() {
        self.value = Top{
            x: Mid{
                y: InnerMost{ z: "hello" },
                opt: null
            }
        };
    }
}