struct Sub {
    a: Int;
    b: Bool;
}

contract TestContract {
    sval: Sub?;

    init() {
        self.sval = Sub{ a: 8, b: false };
    }
}