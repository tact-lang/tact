struct Level3 {
    done: Bool;
    level: Int;
}

struct Level2 {
    remark: String;
    inner: Level3;
}

struct Level1 {
    token: Int;
    nested: Level2;
}

contract TripleNested {
    data: Level1;
    init() {
        self.data = Level1{
            token: 10,
            nested: Level2{
                remark: "hi",
                inner: Level3{ done: false, level: 7 }
            }
        };
    }
}
