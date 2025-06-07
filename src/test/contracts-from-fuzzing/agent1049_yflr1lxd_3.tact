struct Level1 {
    x: Int;
    y: Int;
}

struct Level2 {
    inner: Level1;
    z: Bool;
}

struct Level3 {
    inner2: Level2;
    str: String;
    opt: Bool?;
}

contract MixedNestingOptionals {
    combined: Level3;

    init() {
        self.combined = Level3{
            inner2: Level2{
                inner: Level1{ x: 1, y: 2 },
                z: false
            },
            str: "hello",
            opt: null
        };
    }
}