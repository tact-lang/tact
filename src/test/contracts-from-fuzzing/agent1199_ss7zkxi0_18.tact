struct Inner {
    a: Int?;
    b: Bool;
    c: String?;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                a: null,
                b: true,
                c: null
            }
        };
    }
}