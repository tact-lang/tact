struct LevelInner {
    info: String;
}

struct LevelOuter {
    inner: LevelInner?;
    label: String;
}

contract SkipInnerOptional {
    data: LevelOuter;

    init() {
        self.data = LevelOuter{
            inner: null, // deliberately skip initializing inner
            label: "top"
        };
    }
}