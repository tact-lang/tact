struct TupleTest {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    tup: TupleTest;

    init() {
        self.tup = TupleTest{
            a: 10,
            b: false,
            c: "hello",
        };
    }
}
