struct NestedOpt {
    a: Int?;
    b: Bool?;
}

struct WrapOpt {
    inner: NestedOpt?;
    s: String;
}

contract NestedOptionalStructTest {
    val: WrapOpt;

    init() {
        self.val = WrapOpt{
            inner: null,
            s: "test"
        };
    }
}