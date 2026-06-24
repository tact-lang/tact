struct BoolSerializationTest {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
    flag6: Bool;
    flag7: Bool;
    flag8: Bool;
    flag9: Bool;
    flag10: Bool;
}

contract ManyBools {
    data: BoolSerializationTest;

    init() {
        self.data = BoolSerializationTest{
            flag1:true, flag2:false, flag3:true, flag4:false, flag5:true,
            flag6:true, flag7:false, flag8:true, flag9:false, flag10:true,
        };
    }
}