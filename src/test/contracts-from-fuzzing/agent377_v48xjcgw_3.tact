struct Inner {
    x: Int = 1;
    y: Bool?;
}

struct Outer {
    s: String = "hi";
    inner: Inner;
    z: Address?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 5,
                y: true
            },
            s: "hello",
            z: null
        };
    }
}