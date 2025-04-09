struct Inner {
    a: Int?;
    b: Bool?;
    s: String?;
}

struct Outer {
    foo: Int;
    nested: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            foo: 42,
            nested: Inner{
                a: null,
                b: null,
                s: null
            }
        };
    }
}