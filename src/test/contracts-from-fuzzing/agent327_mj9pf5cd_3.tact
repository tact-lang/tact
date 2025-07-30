struct Nested {
    val: Int;
}

struct Outer {
    maybe: Nested?;
    num: Int;
}

contract OptStructTest {
    data: Outer;

    init() {
        self.data = Outer{ maybe: null, num: 7 };
    }
}
