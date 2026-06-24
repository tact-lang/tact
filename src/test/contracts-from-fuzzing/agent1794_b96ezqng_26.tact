struct Sub {
    a: Int;
}

struct Main {
    a: Int;
    sub: Sub?;
    b: Int;
}

contract OptionalMiddleStruct {
    st: Main;

    init() {
        self.st = Main {
            a:1,
            sub: Sub { a:5 },
            b:2
        };
    }
}
