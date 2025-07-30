struct Inner {
    flag: Bool;
    message: String?;
}

struct Middle {
    num: Int;
    inner: Inner;
}

struct Outer {
    id: Int;
    mid: Middle;
    text: String;
}

contract NestedTest {
    data: Outer = Outer{
        id: 1,
        mid: Middle{
            num: 2,
            inner: Inner{
                flag: true,
                message: "Test",
            },
        },
        text: "Outer",
    };
}