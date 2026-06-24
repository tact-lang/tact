struct Tuple5 {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: Int?;
}

contract TestContract {
    tup: Tuple5;

    init() {
        self.tup = Tuple5{ a: 7, b: true, c: "hello", d: null, e: 42 };
    }

    receive() {}
}