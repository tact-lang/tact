struct Sub {
    x: Int;
    y: Int;
}

contract Arranged {
    a: Int;
    s: Sub;
    b: Cell;

    init() {
        self.a = 1;
        self.s = Sub{ x:2, y:3 };
        self.b = emptyCell();
    }
}