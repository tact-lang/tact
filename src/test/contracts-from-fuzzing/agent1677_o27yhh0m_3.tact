struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    maybe3: Level3?;
    flag: Bool;
}

struct Level1 {
    maybe2: Level2?;
    num: Int;
}

contract MultiNestedLayers {
    state: Level1;

    init() {
        self.state = Level1{
            maybe2: null,
            num: 1
        };
    }
}