struct FlatLarge {
    field1: Int;
    field2: Bool;
    field3: Int;
    field4: Bool;
    field5: Int;
    field6: Bool;
    field7: Int;
    field8: Bool;
    field9: Int;
    field10: Bool;
}

contract LargeFlat {
    data: FlatLarge;

    init() {
        self.data = FlatLarge{
            field1: 1,
            field2: true,
            field3: 2,
            field4: false,
            field5: 3,
            field6: true,
            field7: 4,
            field8: false,
            field9: 5,
            field10: true
        };
    }
}