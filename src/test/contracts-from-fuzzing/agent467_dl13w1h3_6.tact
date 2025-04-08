struct Rec0 {
    depth: Int;
}

struct Rec1 {
    prev: Rec0;
}

struct Rec2 {
    prev: Rec1;
}

contract LongNest {
    chain: Rec2;

    init() {
        self.chain = Rec2{
            prev: Rec1{
                prev: Rec0{depth: 0}
            }
        };
    }
}
