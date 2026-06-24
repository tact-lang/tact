struct Inner {
    i: Int;
    b: Bool;
    s: String;
}

struct Outer {
    a: Int;
    inner: Inner;
    z: Bool;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            a: 10,
            inner: Inner{
                i: 20,
                b: true,
                s: "test"
            },
            z: false
        };
    }
}