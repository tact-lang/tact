struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

struct Outer {
    foo: Inner;
    bar: Int;
}

contract Test {
    s: Outer;

    init() {
        self.s = Outer{
            foo: Inner{
                x: 99,
                y: true,
                z: "hello"
            },
            bar: 12345
        };
    }
}
