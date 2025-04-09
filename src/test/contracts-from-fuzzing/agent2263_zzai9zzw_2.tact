struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    p: Inner;
    text: String?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            p: Inner{
                x: 42,
                y: true
            },
            text: "hello"
        };
    }
}