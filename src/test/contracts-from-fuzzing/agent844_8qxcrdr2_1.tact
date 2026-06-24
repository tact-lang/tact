struct NestedInner {
    flag: Bool;
    count: Int?;
}

struct NestedOuter {
    number: Int;
    inner: NestedInner;
    text: String?;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            number: 42,
            inner: NestedInner{
                flag: true,
                count: 5,
            },
            text: "hello",
        };
    }

    receive() {
        let _ = self.data;
    }
}
