struct Mid {
    a: Int;
    sub: Sub;
}

struct Sub {
    b: Int;
    c: Int;
}

contract ParamType {
    field: Mid;

    init() {
        self.field = Mid{ a: 5, sub: Sub{ b: 6, c: 7 } };
    }

    receive() {
        let temp = self.field;
        dump(temp.sub.b);
    }
}