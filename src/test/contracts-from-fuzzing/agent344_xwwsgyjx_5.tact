struct OptionalNested {
    nested: Bool?;
}

contract OptNestStorage {
    data: OptionalNested?;

    init() {
        self.data = OptionalNested{
            nested: true
        };
    }
}