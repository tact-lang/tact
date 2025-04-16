struct NestedOptional {
    foo: Int?;
    bar: Bool?;
}

struct Wrap {
    inner: NestedOptional?;
}

contract NestedOptionalTest {
    val: Wrap;

    init() {
        self.val = Wrap{ inner: null };
    }
}