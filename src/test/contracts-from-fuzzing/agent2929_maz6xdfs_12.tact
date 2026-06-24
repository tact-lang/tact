struct Inner {
    a: Int = 5;
    b: Bool = false;
    c: String = "ok";
}

struct Outer {
    inner: Inner = Inner{};
    flag: Bool = true;
}

contract DefaultsChain {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}