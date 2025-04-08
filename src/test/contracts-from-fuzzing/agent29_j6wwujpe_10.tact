struct Rec1 {
    a: Int;
    b: Rec2;
}

struct Rec2 {
    c: Int;
    d: Rec3;
}

struct Rec3 {
    e: Int;
}

contract NestedRecursionContract {
    data: Rec1;

    init() {
        self.data = Rec1{
            a: 1,
            b: Rec2{
                c: 2,
                d: Rec3{e:3}
            }
        };
    }
}