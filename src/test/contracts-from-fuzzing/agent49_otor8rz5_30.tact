struct Inner {
    num: Int = 123;
    flag: Bool = false;
}

struct Wrapper {
    inside: Inner = Inner{};
    note: String = "note";
}

contract TestContract {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{};
    }
}
