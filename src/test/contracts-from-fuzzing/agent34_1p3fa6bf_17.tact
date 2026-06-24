struct Inner {
    x: Int = 1;
    y: Bool = false;
}

struct Outer {
    inner: Inner = Inner{};
    s: String = "hi";
}

contract Test16 {
    o: Outer;
    init() {
        self.o = Outer{};
    }
}