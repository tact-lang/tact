struct Inner {
    optionalFlag: Bool?;
    count: Int;
}

struct Outer {
    inner: Inner;
    description: String;
}

contract TestContract {
    state: Outer;
    init() {
        self.state = Outer{
            inner: Inner{
                optionalFlag: null,
                count: 0
            },
            description: "desc"
        };
    }
}