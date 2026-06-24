struct InnerMost {
    val: Int;
    flag: Bool?;
}

struct Inner {
    nested: InnerMost;
    label: String = "ok";
}

struct Outer {
    inner: Inner;
}

contract DeepTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                nested: InnerMost{
                    val: 123,
                    flag: false,
                },
                label: "nested",
            }
        };
    }
}