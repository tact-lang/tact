struct Inner {
    a: Int;
    b: String?;
}

struct Outer {
    x: Bool;
    y: Inner;
    z: Int?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: true,
            y: Inner{
                a: 123,
                b: "test"
            },
            z: null
        };
    }

    receive() {}
}