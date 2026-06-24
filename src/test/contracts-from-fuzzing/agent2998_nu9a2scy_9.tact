struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Inner;
}

contract OptionalNestedContract {
    val: Outer;

    init() {
        self.val = Outer{
            x: Inner{
                a: 5,
                b: null,
            },
        };
    }
}