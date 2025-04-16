struct Level3 {
    x: Int;
}

struct Level2 {
    y: Level3;
    z: Bool;
}

struct Level1 {
    inner: Level2;
    s: String;
}

contract ThreeDeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                y: Level3{ x: 100 },
                z: true
            },
            s: "nested"
        };
    }
}