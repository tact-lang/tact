struct Small1 {
    a: Int;
}
struct Small2 {
    b: Bool;
}
struct Small3 {
    c: String;
}
struct Small4 {
    d: Int?;
}

struct Combo {
    s1: Small1;
    s2: Small2;
    s3: Small3;
    s4: Small4;
}

contract ManySmallStructs {
    c: Combo;

    init() {
        self.c = Combo{
            s1: Small1{a:1},
            s2: Small2{b:true},
            s3: Small3{c:"hi"},
            s4: Small4{d:null}
        };
    }
}