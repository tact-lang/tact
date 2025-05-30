struct InnerMost {
    a: Int;
}
struct Inner {
    im: InnerMost;
}
struct Middle {
    inn: Inner;
}
struct Top {
    mid: Middle;
}

contract VeryDeep {
    data: Top;

    init() {
        self.data = Top{ mid: Middle{ inn: Inner{ im: InnerMost{ a: 77 } } } };
    }
}