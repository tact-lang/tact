struct A {
    a: Int = 1;
}

contract OptAndVals {
    one: Int = 5;
    opt: A? = null;

    init() {
        self.opt = A{ a: 100 };
    }
}