struct OptionalDeep {
    a: Int?;
    b: Inner?;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            a: null,
            b: Inner{ x: 1, y: null }
        };
    }
}
