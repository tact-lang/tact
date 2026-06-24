struct Level3 {
    deep: Int;
    flag: Bool?;
}

struct Level2 {
    nested: Level3;
    msg: String;
}

struct Level1 {
    nest2: Level2;
    num: Int;
}

contract NestedOptional {
    data: Level1;
    init() {
        self.data = Level1{
            nest2: Level2{
                nested: Level3{ deep: 7, flag: null },
                msg: "test"
            },
            num: 77
        };
    }
}