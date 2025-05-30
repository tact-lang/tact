struct Level3 {
    a: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

struct MidRec {
    sub: Level1;
    val: Bool;
}

contract DeepStructs {
    rec: MidRec;

    init() {
        self.rec = MidRec{
            sub: Level1{
                l2: Level2{
                    l3: Level3{
                        a: 5
                    }
                }
            },
            val: true
        };
    }
}