struct Inner {
    foo: Int = 5;
    bar: String?;
}

struct Outer {
    nested: Inner;
    name: String = "default";
}

contract Test20 {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                bar: null,
            },
        };
    }
}