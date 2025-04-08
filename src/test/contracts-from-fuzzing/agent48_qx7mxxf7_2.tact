struct Inner {
    val: Int?;
}

struct Outer {
    nested: Inner;
}

contract DeepOptionalTest {
    data: Outer;

    init() {
        self.data = Outer{ nested: Inner{ val: null } };
    }
}
