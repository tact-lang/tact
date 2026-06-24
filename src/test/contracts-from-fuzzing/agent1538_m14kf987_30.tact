struct Inner {
    flag: Bool?;
}

struct Outer {
    nested: Inner;
    text: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{ flag: null },
            text: "test"
        };
    }
}