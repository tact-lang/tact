struct Level3 {
    x: Int;
    y: Bool?;
    z: String?;
}

struct Level2 {
    inner: Level3;
    msg: String;
}

struct Level1 {
    mid: Level2;
    number: Int?;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            mid: Level2{
                inner: Level3{ x: 1, y: null, z: null },
                msg: "msg"
            },
            number: null
        };
    }
}