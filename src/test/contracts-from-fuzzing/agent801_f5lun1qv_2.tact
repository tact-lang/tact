struct FlatManyFields {
    a1: Int;
    a2: Bool;
    a3: Int;
    a4: Bool;
    a5: Int;
    a6: Bool;
    a7: Int;
    a8: Bool;
    a9: Int;
    a10: Bool;
}

contract ManyFieldsStorage {
    data: FlatManyFields;

    init() {
        self.data = FlatManyFields{
            a1: 1,
            a2: true,
            a3: 3,
            a4: false,
            a5: 5,
            a6: true,
            a7: 7,
            a8: false,
            a9: 9,
            a10: true
        };
    }
}