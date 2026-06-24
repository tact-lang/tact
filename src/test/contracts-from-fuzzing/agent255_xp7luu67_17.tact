// contract with nested defaulted structs
struct Inner {
    x: Int = 7;
    y: Bool = true;
}

struct Outer {
    inner: Inner = Inner{};
    name: String = "abc";
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{};
    }
}