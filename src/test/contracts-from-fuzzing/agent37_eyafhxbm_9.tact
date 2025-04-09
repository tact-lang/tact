struct LongStruct {
    field1: Int;
    field2: String;
    field3: Bool;
    field4: Int;
    field5: String;
    field6: Bool;
    field7: Int;
    field8: String;
    field9: Bool;
    field10: Int;
}

contract TestContract {
    ls: LongStruct = LongStruct{
        field1:1, field2:"a", field3:true, field4:4, field5:"b",
        field6:false, field7:7, field8:"c", field9:true, field10:10
    };

    init() {
        self.ls = LongStruct{
            field1:11, field2:"aa", field3:false, field4:14, field5:"bb",
            field6:true, field7:17, field8:"cc", field9:false, field10:20
        };
    }
    receive() {}
}