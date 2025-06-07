struct BooleanFields {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
}

contract Flags {
    flags: BooleanFields;
    init() {
        self.flags = BooleanFields{
            flag1:true,flag2:false,flag3:true,flag4:false,flag5:true
        };
    }
}