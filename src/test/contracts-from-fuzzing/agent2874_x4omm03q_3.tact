struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    innerField: Inner;
    s: String?;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            innerField: Inner{foo: 10, bar: true},
            s: "text"
        };
    }
}
