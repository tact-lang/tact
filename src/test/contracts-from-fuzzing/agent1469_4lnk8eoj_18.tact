struct Rec1 {
    a: Int;
    b: Bool;
}

struct Rec2 {
    r1: Rec1;
    val: Int?;
}

struct Rec3 {
    r2: Rec2;
    flag: Bool?;
}

contract NestedRecords {
    data: Rec3;

    init() {
        self.data = Rec3{
            r2: Rec2{
                r1: Rec1{ a:123, b:true },
                val: null
            },
            flag: false
        };
    }
}