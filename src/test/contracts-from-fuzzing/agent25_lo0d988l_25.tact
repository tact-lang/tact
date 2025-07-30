// Optional top-level field pointing to nested struct, entire optional null
struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    nestedOpt: Inner?;

    init() {
        self.nestedOpt = null;
    }
}