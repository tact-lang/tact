struct Inner {
    value: Int = 5;
    flag: Bool = false;
}

struct Middle {
    inner: Inner = Inner{};
    text: String = "default";
}

struct Outer {
    middle: Middle = Middle{};
    count: Int = 0;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{}; // use all defaults
    }
}