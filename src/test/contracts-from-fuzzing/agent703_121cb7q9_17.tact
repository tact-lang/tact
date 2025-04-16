struct Inner {
    s: String?;
    n: Int?;
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = Outer{
            inner: null,
            flag: true
        };
    }
}