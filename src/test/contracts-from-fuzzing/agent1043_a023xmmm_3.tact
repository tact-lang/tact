struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    a: Inner;
    b: Int?;
    c: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner{
                x: 42,
                y: true,
            },
            b: null,
            c: "hello",
        };
    }
}