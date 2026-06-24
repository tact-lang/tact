struct Rec1 {
    n: Int;
    text: String;
}

struct Rec2 {
    rec: Rec1;
    b: Bool;
}

struct Rec3 {
    opt: Rec2?;
    i: Int?;
}

contract RecStore {
    rec: Rec3;

    init() {
        self.rec = Rec3{
            opt: Rec2{
                rec: Rec1{n:9,text:"hey"},
                b: true
            },
            i: null
        };
    }
}