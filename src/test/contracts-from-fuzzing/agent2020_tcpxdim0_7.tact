struct ManyOptionalFields {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Slice?;
    o6: Address?;
}

contract OptionalFieldsStorage {
    many: ManyOptionalFields;

    init() {
        self.many = ManyOptionalFields{
            o1: null,
            o2: true,
            o3: null,
            o4: emptyCell(),
            o5: emptyCell().asSlice(),
            o6: null,
        };
    }
}
