struct Level3 {
    val: Int;
    text: String;
    flag: Bool;
}

struct Level2 {
    inner: Level3;
    optionalVal: Int?;
}

struct Level1 {
    nested: Level2;
}

contract NestedOptionalThree {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                inner: Level3{ val: 7, text: "x", flag: true },
                optionalVal: null
            }
        };
    }
}