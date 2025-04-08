struct LargeStruct {
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
}

contract LargeStructContract {
    state: LargeStruct;

    init() {
        self.state = LargeStruct{
            field1:1, field2:2, field3:3, field4:4, field5:5,
            field6:6, field7:7, field8:8, field9:9, field10:10
        };
    }
}
