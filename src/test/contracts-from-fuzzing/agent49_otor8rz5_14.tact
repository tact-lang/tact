struct Inner {
    val: Int = 404;
}

struct Outer {
    nested: Inner = Inner{};
    note: String = "none";
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}
