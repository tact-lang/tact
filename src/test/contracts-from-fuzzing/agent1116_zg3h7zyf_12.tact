struct Inner {
    foo: Int;
    bar: Bool;
}

struct Mid {
    nested: Inner;
    name: String;
}

struct Outer {
    mid: Mid;
    info: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Mid{
                nested: Inner{
                    foo: 77,
                    bar: true
                },
                name: "Nested name"
            },
            info: "Top info"
        };
    }
}