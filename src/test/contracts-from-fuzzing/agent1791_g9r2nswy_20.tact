struct P1 {
    a: Int?;
    b: Bool?;
}

struct P2 {
    c: String?;
    d: P1?;
}

struct P3 {
    e: Cell;
    f: P2;
}

contract Test21 {
    val: P3;
    init() {
        self.val = P3{
            e: emptyCell(),
            f: P2{
                c: null,
                d: null
            }
        };
    }
}
