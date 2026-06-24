struct OptionalStruct {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalSlice: Slice?;
    optionalBuilder: Builder?;
    optionalString: String?;
}

contract StorageAllOptionalsTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            optionalInt: null,
            optionalBool: null,
            optionalSlice: null,
            optionalBuilder: null,
            optionalString: null,
        };
    }
}