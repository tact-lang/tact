struct Inner {
    user: Address;
    num: Int;
}

struct Outer {
    wrap: Inner;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ wrap: Inner{ user: myAddress(), num: 1234 } };
    }
}