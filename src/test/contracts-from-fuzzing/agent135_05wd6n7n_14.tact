struct LevelDeep {
    x: Int;
    y: String?;
}

struct LevelMid {
    sub: LevelDeep?;
}

contract OptionalChain {
    data: LevelMid;

    init() {
        self.data = LevelMid{
            sub: null
        };
    }
}
