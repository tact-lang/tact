// nested optional struct in contract + default value in nested
struct Inner {
    x: Int = 7;
    y: Bool = false;
}

contract TestContract {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}