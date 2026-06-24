struct Rec1 {
    n: Int;
}

struct Rec2 {
    inner: Rec1;
}

struct Rec3 {
    inner: Rec2;
}

struct Rec4 {
    inner: Rec3;
}

contract RecursiveChain {
    field: Rec4;

    init() {
        self.field = Rec4{
            inner: Rec3{
                inner: Rec2{
                    inner: Rec1{n:42}
                }
            }
        };
    }
}
