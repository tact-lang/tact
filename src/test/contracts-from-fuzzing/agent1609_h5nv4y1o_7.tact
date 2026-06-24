struct Data {
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

contract TestContract {
    data: Data;

    init() {
        self.data = Data{
            field1:1, field2:true, field3:2, field4:false, field5:3,
            field6:true, field7:4, field8:false, field9:5, field10:true
        };
    }

    receive() {
        self.data = Data{
            field1:10, field2:false, field3:20, field4:true, field5:30,
            field6:false, field7:40, field8:true, field9:50, field10:false
        };
    }
}