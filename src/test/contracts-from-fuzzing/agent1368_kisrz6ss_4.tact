struct Inner {
    a: Int = 1;
    b: Bool = false;
    c: Address?;
    d: Cell?;
}

struct Outer {
    i: Inner = Inner{c: null, d: null};
    x: String = "hello";
    y: Int?;
}

contract TestContract {
    big: Outer = Outer{i: Inner{c: null, d: null}, y: null};
    init() {}
    receive() {}
}