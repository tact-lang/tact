struct Inner {
    a: Int?;
    b: Bool;
}

struct Outer {
    inner: Inner;
    c: String?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{ inner: Inner{ a: null, b: true }, c: "hi" };
    }
}