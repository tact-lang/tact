struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    x: Int;
    y: Bool;
}

struct Outer {
    middle: Middle;
    str: String;
}

contract NestedDefaultsTest {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    a: 10,
                    b: true
                },
                x: 20,
                y: false
            },
            str: "abc"
        };
    }
}
