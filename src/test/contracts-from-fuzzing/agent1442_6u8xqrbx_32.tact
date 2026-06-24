// deep nesting with optionals at each layer
struct Leaf { val: Int?; }
struct Mid {
    inner: Leaf?;
}
struct Outer {
    inner: Mid?;
}

contract TestContract {
    st: Outer;
    init() {
        self.st = Outer{inner: null};
    }
}