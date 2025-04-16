struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Middle {
    x: Int?;
    y: Bool;
    z: Inner;
}

struct Outer {
    p: Middle;
    q: String?;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            p: Middle{
                x: 10,
                y: true,
                z: Inner{
                    a: 1,
                    b: false,
                    c: "inner",
                },
            },
            q: "hello",
        };
    }
}