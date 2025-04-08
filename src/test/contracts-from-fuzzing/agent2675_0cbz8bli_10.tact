struct InnerMost {
    inside: Int = 123;
    flag: Bool = true;
    text: String = "x";
}

struct Middle {
    im: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract DeepParam(
    data: Outer
) {}