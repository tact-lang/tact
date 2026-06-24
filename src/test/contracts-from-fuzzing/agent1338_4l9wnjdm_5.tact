struct Inner {
    one: Int;
    text: String;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    outerVal: Int;
    moreText: String;
    outerFlag: Bool;
}

contract MixedTypesNested {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{
                one: 11,
                text: "hi",
                flag: true
            },
            outerVal: 42,
            moreText: "hello",
            outerFlag: false
        };
    }
}