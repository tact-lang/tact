struct SimpleTuple {
    one: Int;
    two: Bool;
    three: String;
}

contract MultiVarContract {
    a: Int;
    b: Bool;
    c: SimpleTuple;
    d: SimpleTuple;

    init() {
        self.a = 1;
        self.b = true;
        self.c = SimpleTuple{ one: 10, two: false, three: "hi" };
        self.d = SimpleTuple{ one: 20, two: true, three: "bye" };
    }
}
