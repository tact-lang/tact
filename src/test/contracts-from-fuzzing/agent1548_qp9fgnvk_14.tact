struct Level3 {
    s: String;
    b: Bool;
}

struct Level2 {
    nested: Level3;
    optInt: Int?;
}

struct Level1 {
    nested: Level2;
    optStr: String?;
}

contract Test {
    val: Level1;

    init() {
        self.val = Level1{
            nested: Level2{
                nested: Level3{ s:"hi", b:true },
                optInt: null
            },
            optStr: "hello"
        };
    }
}