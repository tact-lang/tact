struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inner1: Inner?;
    inner2: Inner?;
    val: Int;
}

contract NestedOptInits {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{
                a: null,
                b: true
            },
            inner2: null,
            val: 77
        };
    }
}