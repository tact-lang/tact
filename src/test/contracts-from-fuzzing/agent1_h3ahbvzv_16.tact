struct Inner {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{}
        };
    }
}