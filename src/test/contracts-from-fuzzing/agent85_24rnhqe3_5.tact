struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    nested: Inner;
    optNested: Inner?;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            nested: Inner{
                a: 5,
                b: false,
                c: "nested"
            },
            optNested: null
        };
    }
}