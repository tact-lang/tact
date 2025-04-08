struct Tuple3 {
    a: Int;
    b: Int;
    c: Int;
}

contract TupleField {
    tup: Tuple3;

    init() {
        self.tup = Tuple3{a:10,b:20,c:30};
    }

    receive() {
        let sum = self.tup.a + self.tup.b + self.tup.c;
    }
}