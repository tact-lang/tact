struct OuterWrap { in1: Int?; in2: String?; in3: Bool?; }
struct Wrapper { 
    w1: OuterWrap?;
    w2: OuterWrap?;
    w3: OuterWrap?;
}

contract OptionalMultiple {
    big: Wrapper;

    init() {
        self.big = Wrapper{
            w1: null,
            w2: null,
            w3: null
        };
    }
}