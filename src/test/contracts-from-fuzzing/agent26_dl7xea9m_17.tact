struct Rec1 { x: Int; }
struct Rec2 { y: Bool; }

contract Multi {
    a: Rec1;
    b: Rec2;
    c: Rec1;
    d: Rec2;
    e: Rec1;
    f: Rec2;

    init() {
        self.a = Rec1{x: 1};
        self.b = Rec2{y: true};
        self.c = Rec1{x: 3};
        self.d = Rec2{y: false};
        self.e = Rec1{x: 5};
        self.f = Rec2{y: true};
    }
}