struct OptionalNested {
    nested: OptionalLevel?;
}

struct OptionalLevel {
    x: Int?;
    y: Bool?;
    z: Cell?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested: null
        };
    }
}