struct A {
    one: Int;
    two: Bool?;
}

struct B {
    inner: A;
    str: String;
    opt: String?;
}

struct C {
    sub: B;
    bflag: Bool;
    num: Int;
}

contract Test {
    val: C;

    init() {
        self.val = C{
            sub: B{
                inner: A{one: 1, two: true},
                str: "abc",
                opt: null
            },
            bflag: false,
            num: 100
        };
    }
}