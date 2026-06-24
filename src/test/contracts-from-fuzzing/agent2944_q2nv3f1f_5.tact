struct Level3 {
    v1: Int;
    v2: Bool;
}

struct Level2 {
    mid: Level3;
    txt: String;
}

struct Level1 {
    inner: Level2;
    flag: Bool;
}

contract MultiLevelNested {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                mid: Level3{
                    v1: 5,
                    v2: true
                },
                txt: "test"
            },
            flag: false
        };
    }
}