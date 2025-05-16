struct HasLongFields {
    field01: Int;
    field02: Int;
    field03: Int;
    field04: Int;
    field05: Int;
    field06: Int;
    field07: Int;
    field08: Int;
    field09: Int;
    field10: Int;
    field11: Int;
    field12: Int;
    field13: Int;
    field14: Int;
    field15: Int;
    field16: Int;
    field17: Int;
    field18: Int;
    field19: Int;
    field20: Int;
}

contract TestContract {
    bigStruct: HasLongFields;

    init() {
        self.bigStruct = HasLongFields{
            field01: 1, field02: 2, field03: 3, field04: 4, field05: 5,
            field06: 6, field07: 7, field08: 8, field09: 9, field10: 10,
            field11: 11, field12: 12, field13: 13, field14: 14, field15: 15,
            field16: 16, field17: 17, field18: 18, field19: 19, field20: 20
        };
    }
}