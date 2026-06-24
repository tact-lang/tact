struct Sub {
    a: Int;
    b: Bool;
    c: Cell;
}

contract Test {
    nested: Sub;
    deeper: Sub;
    init() {
        self.nested = Sub{a:1, b:true, c:emptyCell()};
        self.deeper = Sub{a:2, b:false, c:emptyCell()};
    }
}
