struct Level2 {
    flag: Bool;
    note: String;
}

struct Level1 {
    id: Int;
    sub: Level2;
}

contract DeepNestedStruct {
    info: Level1;

    init() {
        self.info = Level1{
            id: 1,
            sub: Level2{
                flag: true,
                note: "Start",
            },
        };
    }

    receive() {
        self.info = Level1{
            id: self.info.id + 1,
            sub: self.info.sub,
        };
    }
}