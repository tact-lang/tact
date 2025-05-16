struct Level3 {
    d: Int as int64;
    flag: Bool;
    txt: String;
}

struct Level2 {
    c: Level3;
    optC: Level3?;
}

struct Level1 {
    b: Level2;
    optB: Level2?;
}

contract ManyNestedPrimitiveSerialization {
    a: Level1;

    init() {
        self.a = Level1{
            b: Level2{
                c: Level3{ d:1000, flag:true, txt:"aaa" },
                optC: null
            },
            optB: null
        };
    }
}
