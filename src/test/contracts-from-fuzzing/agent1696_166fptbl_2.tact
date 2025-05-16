struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Middle {
    inner: Inner?;
    baz: String;
}

struct Outer {
    middle: Middle;
    flag: Bool;
}

contract DeepTest {
    val: Outer;

    init() {
        self.val = Outer{
            middle: Middle{
                inner: Inner{ foo: 7, bar: false },
                baz: "hello"
            },
            flag: true
        };
    }
}