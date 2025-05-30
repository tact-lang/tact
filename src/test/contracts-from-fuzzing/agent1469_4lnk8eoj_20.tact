struct InnerMost {
    x: Int;
}

struct Middle1 {
    im: InnerMost;
}

struct Middle2 {
    im: InnerMost;
}

contract MultiNestedStructs {
    m1: Middle1;
    m2: Middle2;

    init() {
        self.m1 = Middle1{ im: InnerMost{ x:1 } };
        self.m2 = Middle2{ im: InnerMost{ x:2 } };
    }
}