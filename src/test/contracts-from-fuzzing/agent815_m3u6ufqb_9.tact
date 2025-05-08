struct DeeplyNestedOptional {
    s: String?;
    inner: Inner?;
}

struct Inner {
    val: Int;
    b: Bool?;
}

contract DeepOptionals {
    f: DeeplyNestedOptional;

    init() {
        self.f = DeeplyNestedOptional{
            s: "abc",
            inner: Inner{
                val: 5,
                b: null,
            }
        };
    }
}