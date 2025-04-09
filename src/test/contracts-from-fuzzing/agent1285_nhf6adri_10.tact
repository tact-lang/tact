struct Inner {
    s: String = "inner";
}

struct Outer {
    i: Int = 42;
    inner: Inner = Inner{};
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{}; 
    }
}