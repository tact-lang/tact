struct Inner { a: Int; b: String; c: Bool }

contract TestContract {
    f: Inner;

    init() {
        self.f = Inner{ a: 1, b: "hi", c: true };
    }
}