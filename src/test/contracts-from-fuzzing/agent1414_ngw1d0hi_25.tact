struct RecA { a: Int }
struct RecB { b: Int }
struct RecC { c: Int }

struct MultiWrap {
    rA: RecA;
    rB: RecB;
    rC: RecC;
}

contract MultiStructField {
    val: MultiWrap;

    init() {
        self.val = MultiWrap{
            rA: RecA{ a: 1 },
            rB: RecB{ b: 2 },
            rC: RecC{ c: 3 }
        };
    }
}