struct Outer {
    s: String;
    nested: Inner;
}

struct Inner {
    b: Bool;
    val: Int;
}

contract OrderTest {
    field: Outer;

    init() {
        self.field = Outer{
            s: "test",
            nested: Inner{
                b: true,
                val: 42,
            }
        };
    }
}