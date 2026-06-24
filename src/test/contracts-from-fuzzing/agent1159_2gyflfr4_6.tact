struct OptionalNest {
    field1: Int?;
    field2: Bool?;
    field3: String?;
    field4: Cell?;
    field5: Address?;
}

contract TestContract {
    optNest: OptionalNest;

    init() {
        self.optNest = OptionalNest{
            field1: null,
            field2: null,
            field3: null,
            field4: null,
            field5: null,
        };
    }
}