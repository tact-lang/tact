struct Inner {
    value: Int?;
}

struct Outer {
    nested: Inner;
}

contract TestStorage {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                value: null,
            },
        };
    }
}