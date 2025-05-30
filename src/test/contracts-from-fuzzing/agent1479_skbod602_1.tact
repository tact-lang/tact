struct Nested {
    alpha: Int;
    beta: Int?;
}

contract TestStorage {
    foo: Int;
    bar: Bool;
    baz: Cell;
    opt1: Int?;
    opt2: Bool?;
    opt3: Cell?;
    st: Nested;
    optNested: Nested?;
    
    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = emptyCell();
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
        self.st = Nested{ alpha: 12, beta: null };
        self.optNested = null;
    }
}
