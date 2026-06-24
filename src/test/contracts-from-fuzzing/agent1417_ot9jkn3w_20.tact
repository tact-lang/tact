struct Param {
    a: Int;
    b: Int;
    c: Int;
}

contract DefaultsAndAssigns {
    foo: Param = Param{ a:1, b:2, c:3 };
    bar: Int;

    init() {
        self.bar = 7;
    }
}