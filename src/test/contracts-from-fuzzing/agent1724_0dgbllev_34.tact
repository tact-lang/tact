struct Level2 {
    a: Int;
    b: Bool;
}

struct Level1 {
    inner: Level2;
    x: Int?;
    y: Bool?;
}

contract MixNestOpt {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{ a:1, b:true },
            x: null,
            y: null
        };
    }
}