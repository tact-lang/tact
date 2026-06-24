struct SInner {
    s: String;
}

contract NestedWithString {
    inner: SInner;

    init() {
        self.inner = SInner{s:"test"};
    }
}