struct BoolIntStruct {
    flag: Bool;
    val: Int;
}

contract PersistStructInState {
    s: BoolIntStruct;
    init() {
        self.s = BoolIntStruct{
            flag: false,
            val: 55
        };
    }
    receive() {
        if(self.s.flag) {
            self.s.val += 1;
        }
    }
}