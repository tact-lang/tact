struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    a: Int;
    b: Inner;
    c: String?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: 1,
            b: Inner{
                x: 2,
                y: true,
            },
            c: "hello",
        };
    }
}