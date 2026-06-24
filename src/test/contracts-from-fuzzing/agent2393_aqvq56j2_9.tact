struct InnerMost {
    z: Int;
    s: String;
}
struct Middle {
    m: Bool;
    innermost: InnerMost;
}
struct Outer {
    x: Int;
    middle: Middle;
}

contract Nesting {
    data: Outer = Outer{ x: 1, middle: Middle{ m: true, innermost: InnerMost{ z: 42, s: "hi" } } };
}