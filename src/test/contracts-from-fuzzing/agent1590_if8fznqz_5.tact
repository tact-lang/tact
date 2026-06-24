struct Level3 { x: Int; y: Int; z: Int }

struct Level2 {
    sub: Level3;
    flag: Bool;
}

struct Level1 {
    nested: Level2;
    msg: String;
}

contract DeepNested {
    store: Level1;

    init() {
        self.store = Level1{
            nested: Level2{
                sub: Level3{
                    x: 1,
                    y: 2,
                    z: 3
                },
                flag: true
            },
            msg: "hi"
        };
    }
}