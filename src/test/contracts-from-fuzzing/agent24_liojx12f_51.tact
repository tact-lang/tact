// contract with empty optional struct inside optional struct
struct Inner {
    x: Int?;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    outer: Outer = Outer{
        inner: null
    };
    init() {}
}