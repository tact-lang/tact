struct Rec {
    text: String;
    inner: Rec2;
}

struct Rec2 {
    num: Int;
}

contract StringThenIntNested {
    r: Rec;
    init() {
        self.r = Rec{ text: "one", inner: Rec2{ num: 2 } };
    }
}
