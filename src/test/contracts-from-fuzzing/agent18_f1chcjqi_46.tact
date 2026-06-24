struct Dual {
    a: Int;
    b: Bool;
}

contract TwoStructs {
    val1: Dual;
    val2: Dual;
    init() {
        self.val1 = Dual{a:1,b:true};
        self.val2 = Dual{a:2,b:false};
    }
}