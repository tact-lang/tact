struct OptionalLayer {
    nested: Inner?;
}

struct Inner {
    value: Int;
}

contract TestContract {
    optional: OptionalLayer;

    init() {
        self.optional = OptionalLayer{
            nested: null
        };
    }

    receive() {
        let _ = self.optional.nested;
    }
}