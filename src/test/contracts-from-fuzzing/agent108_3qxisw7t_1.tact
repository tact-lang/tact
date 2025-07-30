struct Inner { a: Int; b: Bool?; c: String; }

contract TestContract {
    nested1: Inner;
    nested2: Inner?;

    init() {
        self.nested1 = Inner{ a: 5, b: true, c: "hello" };
        self.nested2 = null;
    }
}