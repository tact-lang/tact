struct NestedOptional {
    foo: Int?;
    bar: String?;
}

struct MidOpt {
    inner: NestedOptional?;
}

contract DeepOptionals {
    val: MidOpt?;

    init() {
        self.val = MidOpt{ inner: NestedOptional{ foo: null, bar: "x" } };
    }
}