struct DeepNest {
    x: Int;
    y: Bool?;
}

struct LevelTwo {
    inner: DeepNest;
    z: String;
}

contract VeryNested {
    value: LevelTwo;

    init() {
        self.value = LevelTwo{
            inner: DeepNest{ x: 1, y: null },
            z: "ok"
        };
    }
}