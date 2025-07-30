struct Rec1 {
    a: Int;
    b: Bool;
    c: Rec2;
}

struct Rec2 {
    d: String;
    e: Rec3;
}

struct Rec3 {
    f: Int;
    g: Bool;
}

contract ChainStructs {
    top: Rec1;

    init() {
        self.top = Rec1{
            a:1,
            b:true,
            c: Rec2{
                d:"hi",
                e: Rec3{ f:5, g:false }
            }
        };
    }
}