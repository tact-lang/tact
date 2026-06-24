struct InnerMost {
    val: Int;
}

struct Mid {
    im: InnerMost;
}

struct Outer {
    mid: Mid;
}

contract Test {
    st: Outer = Outer{ mid: Mid{ im: InnerMost{ val: 777 } } };
}