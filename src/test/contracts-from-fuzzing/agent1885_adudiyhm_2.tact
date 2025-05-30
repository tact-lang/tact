struct MultiOptional {
    field1: Int?;
    field2: Bool?;
    field3: String?;
    field4: Cell?;
}

contract MultiOptStorage {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            field1: null,
            field2: true,
            field3: null,
            field4: null
        };
    }
}