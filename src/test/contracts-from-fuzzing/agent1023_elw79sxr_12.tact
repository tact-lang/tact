struct Holder {
    num: Int;
    text: String;
}

contract TestNestedPersistent {
    a: Holder;
    b: Int;

    init() {
        self.a = Holder{ num: 42, text: "abc" };
        self.b = 1;
    }
}