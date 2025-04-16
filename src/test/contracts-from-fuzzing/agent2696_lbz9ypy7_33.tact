struct Inner {
    a: Int?;
}

struct Outer {
    b: Inner?;
}

contract NullTest {
    val: Outer?;
    init() {
        self.val = null;
    }
}