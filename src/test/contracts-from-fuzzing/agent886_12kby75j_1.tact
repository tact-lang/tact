struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    myStruct: Inner;

    init() {
        self.myStruct = Inner{ a: 1, b: true };
    }
}