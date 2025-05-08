struct ComplexOptional {
    field1: Int?;
    field2: Bool?;
    field3: String?;
    field4: Cell?;
    field5: Slice?;
    field6: Address?;
}

contract TestContract {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{
            field1: null,
            field2: null,
            field3: null,
            field4: null,
            field5: null,
            field6: null,
        };
    }
}