struct A {
    foo: Int;
}

contract ContractA {
    val: A;
    opt: A?;

    init() {
        self.val = A{ foo: 1 };
        self.opt = null;
    }
}