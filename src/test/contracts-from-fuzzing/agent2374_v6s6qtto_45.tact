struct Rec1 {
    a: Int;
    b: Bool;
}

struct Rec2 {
    r: Rec1;
    s: Rec1;
    c: String?;
}

contract RecStorage {
    state: Rec2;

    init() {
        self.state = Rec2{
            r: Rec1{a:1,b:true},
            s: Rec1{a:2,b:false},
            c: null
        };
    }
}