struct Flat {
    field0: Int;
    field1: Int;
    field2: Int;
    field3: Int;
    field4: Int;
    field5: Int;
    field6: Int;
    field7: Int;
    field8: Int;
    field9: Int;
    field10: Int;
    field11: Int;
    field12: Int;
    field13: Int;
    field14: Int;
}

contract TestFlat {
    receive() {
        // Instantiate a long, flat struct with 15 fields
        let s = Flat {
            field0: 0,
            field1: 1,
            field2: 2,
            field3: 3,
            field4: 4,
            field5: 5,
            field6: 6,
            field7: 7,
            field8: 8,
            field9: 9,
            field10: 10,
            field11: 11,
            field12: 12,
            field13: 13,
            field14: 14
        };
    }
}
