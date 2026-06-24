struct Inner {
    a: Int;
    b: Bool;
}

struct Mid {
    inner: Inner;
    count: Int;
}

struct Outer {
    mid: Mid;
    label: String;
}

contract DeepStructContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Mid{
                inner: Inner{ a: 1, b: true },
                count: 10
            },
            label: "test"
        };
    }

    receive() {
        self.data = self.data; // dummy access
    }
}