struct Inner {
    x: Int;
    y: Int;
    z: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
    text: String;
}

contract DeepTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 1,
                y: 2,
                z: 3,
            },
            flag: true,
            text: "Hello",
        };
    }
}