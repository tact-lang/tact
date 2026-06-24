struct Inner {
    x: Int;
    y: Bool?;
    s: String;
}

contract NestedContract {
    field: Inner;

    init() {
        self.field = Inner{
            x: 10,
            y: null,
            s: "nested"
        };
    }
}
