struct S {
    a: Int = 1;
    b: Int = 2;
}

contract ConstStruct {
    const S_CONST: S = S { a: 10, b: 20 };
    v: Int;

    init() {
        self.v = self.S_CONST.a;
    }
}