struct A {
    flag: Bool;
    num: Int as uint8;
    txt: String;
}

struct B {
    a: A;
    num2: Int;
}

struct C {
    maybeB: B?;
    msg: String;
}

contract DeepOptional {
    c: C = C{
        maybeB: null,
        msg: ""
    };
    receive() {
        let _ = self.c.maybeB;
    }
}