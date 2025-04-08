struct Inner {
    a: Int;
    b: Bool?;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    mid: Middle?;
    number: Int;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{
                    a: 1,
                    b: true,
                },
                flag: false,
            },
            number: 42,
        };
    }
}