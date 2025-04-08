struct Outer {
    foo: Int;
    bar: Bool;
    nested: Inner;
}

struct Inner {
    x: Int;
    y: String;
    flag: Bool;
}

contract NestingTest {
    state: Outer;
    init() {
        self.state = Outer{
            foo: 42,
            bar: false,
            nested: Inner{
                x: 1,
                y: "yo",
                flag: true
            }
        };
    }
}