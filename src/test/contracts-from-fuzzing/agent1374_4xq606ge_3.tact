struct Inner {
    x: Int;
    y: Bool;
}

struct Mid {
    a: Inner;
    b: String;
}

struct Outer {
    first: Mid;
    second: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            first: Mid{
                a: Inner{
                    x: 10,
                    y: true,
                },
                b: "mid",
            },
            second: 99,
        };
    }
}