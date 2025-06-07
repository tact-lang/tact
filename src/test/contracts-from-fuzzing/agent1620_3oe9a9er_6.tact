struct Level3 {
    p: Int;
    q: Int;
}

struct Level2 {
    inner: Level3?;
    flag: Bool;
}

struct Level1 {
    deep: Level2?;
}

contract OptionalNestedStruct {
    data: Level1;

    init() {
        self.data = Level1{
            deep: Level2{
                inner: Level3{
                    p: 10,
                    q: 20
                },
                flag: true
            }
        };
    }
}