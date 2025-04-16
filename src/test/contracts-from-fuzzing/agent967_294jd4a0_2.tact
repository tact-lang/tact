struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3;
    x: Bool;
}

struct Level1 {
    inner: Level2;
}

contract DeepNestedFields {
    s: Level1;

    init() {
        self.s = Level1{
            inner: Level2{
                y: Level3{z: 1},
                x: false
            }
        };
    }
}