struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    i: Inner;
    s: String;
}

contract Test {
    o: Outer = Outer{i: Inner{a: 10, b: false}, s: "nested"};
}