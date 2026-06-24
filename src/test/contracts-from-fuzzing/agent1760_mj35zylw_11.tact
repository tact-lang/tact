struct Sub {
    a: Int;
    b: Bool?;
    c: String;
}

contract FieldOrder {
    first: Int;
    sub: Sub;
    last: Bool;

    init() {
        self.first = 10;
        self.sub = Sub{a: 1, b: null, c: "ok"};
        self.last = true;
    }
}