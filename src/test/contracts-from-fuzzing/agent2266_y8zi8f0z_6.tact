struct Level3 {
    tf: Bool;
    num: Int;
}

struct Level2 {
    innermost: Level3;
    optNum: Int?;
}

struct Level1 {
    nested: Level2;
    strVal: String?;
}

contract Test {
    payload: Level1;

    init() {
        self.payload = Level1{
            nested: Level2{
                innermost: Level3{tf: true, num: 100},
                optNum: null,
            },
            strVal: "hello",
        };
    }
}
