struct Rec1 {
    i: Int;
    s: Rec2;
}

struct Rec2 {
    j: Int;
    t: Rec3;
}

struct Rec3 {
    k: String;
    done: Bool;
}

contract RecursiveLayers {
    val: Rec1;
    init() {
        self.val = Rec1{ i:1, s:Rec2{ j:2, t:Rec3{ k:"ok", done:true }}};
    }
}