struct Inner {
    value: Int = 99;
    flag: Bool = false;
}

struct Outer {
    inner: Inner;
    status: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ value: 123, flag: true },
            status: "ok"
        };
    }
}