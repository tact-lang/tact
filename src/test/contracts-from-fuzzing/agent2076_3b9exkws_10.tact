struct MixedOptionals {
    field1: Int?;
    field2: Bool?;
    field3: String?;
    field4: Cell?;
    field5: Address?;
}

contract TestContract {
    data: MixedOptionals;

    init() {
        self.data = MixedOptionals{
            field1: null,
            field2: true,
            field3: null,
            field4: emptyCell(),
            field5: null
        };
    }
}