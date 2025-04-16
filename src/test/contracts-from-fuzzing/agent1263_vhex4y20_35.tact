struct Inner {
    x: Int = 1;
    y: Int = 2;
}

struct Mid {
    inner: Inner = Inner{};
}

struct Outer {
    mid: Mid = Mid{};
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{};
    }
}