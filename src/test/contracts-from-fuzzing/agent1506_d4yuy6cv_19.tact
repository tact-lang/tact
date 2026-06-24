struct Base {
    x: Int;
    y: Int;
    b: Bool;
}

contract OptNested {
    nestedOpt: Base? = null;
    init() {
        self.nestedOpt = Base{ x:1, y:2, b:true };
        self.nestedOpt = null;
    }
}
// test optional nested struct in contract storage, assign to value then null