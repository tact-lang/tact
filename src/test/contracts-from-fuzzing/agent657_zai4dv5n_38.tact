struct NestedMany {
    a: Int;
    b: Level1?;
}

struct Level1 {
    a: Int?;
    b: Bool;
    c: String?;
    d: Level2;
}

struct Level2 {
    k: Int;
    m: Bool?;
    n: String;
}

contract BigNested {
    field: NestedMany;

    init() {
        self.field = NestedMany{
            a:1,
            b:Level1{
                a:null,
                b:true,
                c:null,
                d:Level2{ k:2, m:false, n:"test" }
            }
        };
    }
}