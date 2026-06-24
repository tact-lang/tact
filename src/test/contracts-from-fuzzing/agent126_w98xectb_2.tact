struct Inner {
    a: Int;
    optB: Bool?;
}

struct Outer {
    inner: Inner;
    s: String;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            inner: Inner{
                a: 7,
                optB: null
            },
            s: "ok"
        };
    }
}