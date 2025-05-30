// optional nested struct entirely optional
struct Inner {
    foo: Int;
    bar: String;
}

contract TestContract {
    nestedOpt: Inner?;

    init() {
        self.nestedOpt = null;
    }
}