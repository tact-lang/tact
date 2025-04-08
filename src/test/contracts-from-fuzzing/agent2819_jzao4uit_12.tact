struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: String;
    d: Int?;
}

contract TestContract {
    x: S1;
    y: S2;

    init() {
        self.x = S1{a:5, b:true};
        self.y = S2{c:"hi", d:null};
    }
}