struct TupleLike {
    a: Int;
    b: Bool;
    c: Int;
}

contract ManyPrimitives {
    tup: TupleLike;
    init() {
        self.tup = TupleLike{ a:1, b:true, c:2 };
    }
    receive() {
        let _ = self.tup.b;
    }
}