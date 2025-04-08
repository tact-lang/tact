struct ContainsBool {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
    flag6: Bool;
    flag7: Bool;
    flag8: Bool;
}

contract BoolPackingTest {
    data: ContainsBool;
    init() {
        self.data = ContainsBool{
            flag1:true,flag2:false,flag3:true,flag4:true,
            flag5:false,flag6:true,flag7:false,flag8:false
        };
    }
}