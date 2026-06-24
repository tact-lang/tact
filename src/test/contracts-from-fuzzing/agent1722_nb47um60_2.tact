struct Level2 {
    z: Int;
    w: Bool?;
    s: String;
}

struct Level1 {
    x: Int;
    y: Level2;
}

contract DeepNested {
    inner: Level1;

    init() {
        self.inner = Level1{
            x: 7,
            y: Level2{
                z: 42,
                w: null,
                s: "nested"
            }
        };
    }
}