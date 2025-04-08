struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

struct Outer {
    i: Int;
    s: String;
    nested: Inner;
    optNested: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            i: 42,
            s: "Hi",
            nested: Inner{
                a: 1,
                b: true,
                c: "Hello",
            },
            optNested: null,
        };
    }

    receive() {
        let _ = self.data.i;
    }
}