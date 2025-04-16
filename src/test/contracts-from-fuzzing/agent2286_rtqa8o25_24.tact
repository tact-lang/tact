struct Tuple {
    a: Int;
    b: Bool;
    c: String;
}

contract TupleStorage {
    t: Tuple = Tuple{ a:1, b: true, c: "hi" };

    init() {
        self.t = Tuple{ a:2, b: false, c: "bye" };
    }
}