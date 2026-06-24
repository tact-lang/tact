struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    num: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{ a: 5, b: false, c: "hello" },
                flag: true
            },
            num: 99
        };
    }
}