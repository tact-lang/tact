// test optional struct wrapping a struct with defaulted fields
struct Inner {
    foo: Int = 10;
    bar: Bool = false;
}

contract TestContract {
    innerOpt: Inner?;
    init() {
        self.innerOpt = null;
    }
}