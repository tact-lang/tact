struct OptBool {
    flag1: Bool?;
    flag2: Bool?;
}

contract OptBoolPersist {
    val: OptBool;
    init() {
        self.val = OptBool{ flag1:true, flag2:null };
    }
}