struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    c: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{a: 1, b: false},
            c: "test"
        };
    }
}