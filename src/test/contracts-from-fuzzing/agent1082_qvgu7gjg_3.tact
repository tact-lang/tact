struct OptionalTest {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeAddress: Address?;
    maybeString: String?;
    maybeCell: Cell?;
    maybeSlice: Slice?;
    maybeBuilder: Builder?;
}

contract TestContract {
    data: OptionalTest;

    init() {
        self.data = OptionalTest{
            maybeInt: null,
            maybeBool: null,
            maybeAddress: null,
            maybeString: null,
            maybeCell: null,
            maybeSlice: null,
            maybeBuilder: null,
        };
    }
}
