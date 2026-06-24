struct Rec1 {
    a: Int;
    b: Rec2;
}

struct Rec2 {
    c: Int;
    d: Rec3;
}

struct Rec3 {
    e: Bool;
    f: Rec4;
}

struct Rec4 {
    g: Int;
}

contract Test {
    r: Rec1;
    init() {
        self.r = Rec1{
            a: 1,
            b: Rec2{
                c:2, d: Rec3{
                    e:true, f: Rec4{ g:4 }
                }
            }
        };
    }
}