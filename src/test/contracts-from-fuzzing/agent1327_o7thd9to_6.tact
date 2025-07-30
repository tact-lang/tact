struct Level3 {
    z: Int as uint8;
    label: String?;
}

struct Level2 {
    y: Int as int16;
    deep: Level3;
}

struct Level1 {
    x: Int;
    inner: Level2?;
}

contract Test {
    compound: Level1;

    init() {
        self.compound = Level1{
            x: 77,
            inner: Level2{
                y: -123,
                deep: Level3{
                    z: 1,
                    label: "deepest"
                }
            }
        };
    }
}