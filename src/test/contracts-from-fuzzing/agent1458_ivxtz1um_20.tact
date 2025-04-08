struct Outermost {
    level: Int;
    second: Middle?;
}

struct Middle {
    name: String;
    third: InnerMost?;
}

struct InnerMost {
    active: Bool;
}

contract OptionalDepth {
    info: Outermost;

    init() {
        self.info = Outermost{ level: 1, second: null };
    }
}