struct Inner {
    s: String;
}

struct Outer {
    x: Int;
    mid: Inner;
    flag: Bool;
}

contract Test {
    data: Outer = Outer{x:1, mid:Inner{s:"hi"}, flag:false};
}
