struct RecA {
    val: Int;
}

struct RecB {
    a: RecA;
    opt: Int?;
}

struct RecC {
    b: RecB;
    test: Bool;
}

contract MultiLevel {
    field: RecC;

    init() {
        self.field = RecC{
            b: RecB{ a: RecA{ val: 55 }, opt:null },
            test: true
        };
    }
}