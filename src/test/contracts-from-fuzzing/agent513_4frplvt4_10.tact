struct A {
    foo: Int;
    bar: Bool;
    baz: Address;
    yes: String;
}

struct B {
    aa: A;
    bb: A;
    cc: A;
    dd: A;
    ee: A;
}

contract Test {
    big: B;

    init() {
        let ainst = A{ foo: 1, bar: false, baz: myAddress(), yes: "ok" };
        self.big = B{
            aa: ainst,
            bb: ainst,
            cc: ainst,
            dd: ainst,
            ee: ainst
        };
    }

    receive() {}
}