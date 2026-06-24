struct Inner1 {
    f1: Int;
    f2: Bool;
    f3: Address;
}

contract TestContract {
    s: Inner1;

    init() {
        self.s = Inner1{
            f1: 1,
            f2: false,
            f3: myAddress(),
        };
    }
}
