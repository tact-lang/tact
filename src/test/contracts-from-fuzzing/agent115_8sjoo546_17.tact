// optional persistent struct with defaulted fields inside
struct Inner {
    a: Int = 1;
    b: Bool = false;
}

contract Test {
    s: Inner?;
    init() {
        self.s = Inner{};
    }
}