struct InnerMost {
    flag: Bool;
}

struct Middle {
    im: InnerMost;
    note: String;
}

contract OptionalNested {
    st: Middle?;
    
    init() {
        self.st = Middle{ im: InnerMost{ flag: true }, note: "abc" };
    }
}