struct Inner {
    x: Int;
    y: Int?;
    z: Bool?;
}

struct Outer {
    inner: Inner;
    val: Int?;
}

contract NestedStructOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 10,
                y: null,
                z: true
            },
            val: 20
        };
    }
}
