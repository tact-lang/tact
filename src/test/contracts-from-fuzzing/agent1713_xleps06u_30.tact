// Nested with default-filled struct containing optional
struct Inner {
    v: Int? = null;
}
struct Outer {
    inr: Inner = Inner{};
}

contract OStructsDefaults {
    data: Outer;
    init() {
        self.data = Outer{};
    }
}