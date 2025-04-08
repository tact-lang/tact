struct Inner {
    flag: Bool?;
    number: Int?;
}

struct Outer {
    inner: Inner;
    value: Int;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{
                flag: true,
                number: null,
            },
            value: 5,
        };
    }
}