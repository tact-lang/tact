struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    s: Inner;
    z: String;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            s: Inner{
                x: 7,
                y: null,
            },
            z: "hello"
        };
    }
}