struct NestedPoint {
    x: Int;
    y: Int;
}

struct Complex {
    inner: NestedPoint;
    flag: Bool;
    text: String;
    amount: Int;
    nestedOpt: NestedPoint?;
}

contract Test {
    data: Complex;

    init() {
        self.data = Complex{
            inner: NestedPoint{ x: 1, y: 2 },
            flag: true,
            text: "hello",
            amount: 42,
            nestedOpt: null,
        };
    }
}
