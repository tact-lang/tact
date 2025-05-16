struct NestedDefaults {
    a: Int = 7;
    b: Inner;
}
struct Inner {
    y: Bool = true;
}
contract NestedStructDefaults {
    st: NestedDefaults;
    init() {
        self.st = NestedDefaults{ b: Inner{} };
    }
}