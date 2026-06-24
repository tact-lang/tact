struct Inner {
    x: Int;
    y: Int;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    text: String;
    middle: Middle;
}

contract TestContract {
    out: Outer;

    init() {
        self.out = Outer{
            text: "hello",
            middle: Middle{
                inner: Inner{x: 1, y: 2},
                flag: true
            }
        };
    }
}