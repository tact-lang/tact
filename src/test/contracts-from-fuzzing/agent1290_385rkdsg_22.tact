// Optional struct field deeply optional
struct Inner {
    a: Int;
    b: String?;
}

contract TestOpt {
    maybe: Inner?;

    init() {
        self.maybe = null;
    }

    receive() {
        self.maybe = Inner{ a: 5, b: "hi" };
    }
}