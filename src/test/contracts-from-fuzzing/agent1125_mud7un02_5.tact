struct NestedOptionals {
    x: Int?;
    y: Bool?;
    z: Inner?;
}

struct Inner {
    a: String?;
    b: Address;
}

contract TestContract {
    v: NestedOptionals;

    init() {
        self.v = NestedOptionals{
            x: null,
            y: null,
            z: null,
        };
    }
}