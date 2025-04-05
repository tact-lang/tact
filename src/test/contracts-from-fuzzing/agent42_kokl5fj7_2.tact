struct LongStruct {
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
    field15: Int;
    field16: Int;
    field17: Int;
    field18: Int;
    field19: Int;
    field20: Int;
    field21: Int;
    field22: Int;
    field23: Int;
    field24: Int;
    field25: Int;
    field26: Int;
    field27: Int;
    field28: Int;
    field29: Int;
    field30: Int;
}

fun compute_sum(s: LongStruct): Int {
    // return a simple sum of a few fields to force usage of the struct
    return s.field1 + s.field2 + s.field3 + s.field4 + s.field5;
}

contract TestContract {
    receive() {
        let s: LongStruct = LongStruct{
            field1: 1, field2: 2, field3: 3, field4: 4, field5: 5,
            field6: 6, field7: 7, field8: 8, field9: 9, field10: 10,
            field11: 11, field12: 12, field13: 13, field14: 14, field15: 15,
            field16: 16, field17: 17, field18: 18, field19: 19, field20: 20,
            field21: 21, field22: 22, field23: 23, field24: 24, field25: 25,
            field26: 26, field27: 27, field28: 28, field29: 29, field30: 30
        };
        compute_sum(s);
    }
}
