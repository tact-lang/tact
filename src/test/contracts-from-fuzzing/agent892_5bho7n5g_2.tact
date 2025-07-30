struct Inner {
    val: Int;
    nested: Inner2;
}

struct Inner2 {
    flag: Bool;
    amount: Int;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner { val: 10, nested: Inner2 { flag: false, amount: 99 } };
    }
}