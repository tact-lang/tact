struct Level3Text {
    text: String?;
}

struct Level2Inner {
    lv3: Level3Text?;
}

contract NestedOptionText {
    inner: Level2Inner;

    init() {
        self.inner = Level2Inner{
            lv3: null
        };
    }
}