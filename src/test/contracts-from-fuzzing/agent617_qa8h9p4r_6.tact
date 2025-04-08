struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptTest {
    data: OptionalFields;
    init() {
        self.data = OptionalFields{
            a: 1, b: true, c: myAddress(), d: emptyCell(), e: emptyCell().asSlice(), f: "hi"
        };
    }
}