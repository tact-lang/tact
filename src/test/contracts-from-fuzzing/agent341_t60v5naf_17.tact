struct InnerMost {
    x: Int;
}

struct Mid {
    im: InnerMost;
}

struct Out {
    m: Mid;
}

contract Defaulted {
    s: Out = Out{ m: Mid{ im: InnerMost{ x: 42 } } };
}