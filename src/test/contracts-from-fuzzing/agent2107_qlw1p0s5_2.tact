struct Inner {
    a: Int;
    b: String?;
}

struct Outer {
    x: Bool;
    y: Inner;
    z: String;
}

contract DeepStorage {
    payload: Outer;

    init() {
        self.payload = Outer{
            x: true,
            y: Inner{
                a: 42,
                b: null,
            },
            z: "hello",
        };
    }
}