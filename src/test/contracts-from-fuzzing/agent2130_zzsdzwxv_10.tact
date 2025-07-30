struct Inner {
    x: String?;
}

struct Outer {
    i: Inner?;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{ i: Inner{ x: "xval" } };
    }
}