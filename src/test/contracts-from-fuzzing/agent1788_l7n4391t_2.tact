struct DeepInner {
    a: Int;
    b: Bool?;
}

struct Inner {
    x: DeepInner;
    y: String;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{
                x: DeepInner{
                    a: 42,
                    b: true,
                },
                y: "txt"
            },
            flag: false
        };
    }
}