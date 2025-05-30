struct OptionalNested {
    a: Int?;
    b: Inner?;
}

struct Inner {
    x: Bool;
    y: Int;
}

contract TestContract {
    val: OptionalNested;
    init() {
        self.val = OptionalNested {
            a: null,
            b: Inner{ x: true, y: 42 }
        };
    }
}