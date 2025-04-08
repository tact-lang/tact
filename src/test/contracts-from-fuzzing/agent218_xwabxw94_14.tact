struct Inner {
    n: Int?;
}

struct Outer {
    i: Inner;
}

contract ImplicitNullTest {
    val: Outer;

    init() {
        self.val = Outer{ i: Inner{} };
    }
}