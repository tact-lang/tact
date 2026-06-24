struct Rec {
    v: Int;
    s: SubRec?;
}

struct SubRec {
    b: Bool;
    s: String?;
}

contract RecOptTest {
    val: Rec;

    init() {
        self.val = Rec{ v:1, s:null };
    }
}