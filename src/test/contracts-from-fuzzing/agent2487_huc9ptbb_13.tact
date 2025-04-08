struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            inner: null
        };
    }
}