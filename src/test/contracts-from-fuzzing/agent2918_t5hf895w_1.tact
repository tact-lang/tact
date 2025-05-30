struct Inner {
    a: Int;
    b: Bool;
    c: Address;
}

contract TestContract {
    myField: Inner;

    init() {
        self.myField = Inner{
            a: 1,
            b: true,
            c: myAddress(),
        };
    }
}
