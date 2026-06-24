struct P1 { a:Int; }
struct P2 { b:Int; }
struct P3 { c:Int; }

struct Combo {
    p1: P1?;
    p2: P2?;
    p3: P3?;
}

contract TestContract {
    combined: Combo;

    init() {
        self.combined = Combo{ p1:null, p2:null, p3:null };
    }
}