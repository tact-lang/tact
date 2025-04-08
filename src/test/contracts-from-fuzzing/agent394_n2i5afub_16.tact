struct Mid {
    foo: Int?;
    bar: Bool?;
}

struct Root {
    left: Mid;
    right: Mid;
}

contract TestContract {
    data: Root;

    init() {
        self.data = Root{
            left: Mid{ foo: null, bar: true },
            right: Mid{ foo: 42, bar: null }
        };
    }
}