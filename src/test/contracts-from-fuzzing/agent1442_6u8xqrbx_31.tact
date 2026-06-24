// Fuzz: deeply nested multiple optional layers
struct Leaf { val: Int; }
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