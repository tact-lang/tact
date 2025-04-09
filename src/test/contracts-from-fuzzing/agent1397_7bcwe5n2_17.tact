struct RecStruct {
    val: Int;
    flag: Bool;
    addr: Address;
}

contract TestContract {
    rec: RecStruct;

    init() {
        self.rec = RecStruct{
            val: 55,
            flag: true,
            addr: myAddress(),
        };
    }

    receive() {
        let _ = self.rec.val;
        let _ = self.rec.flag;
        let _ = self.rec.addr;
    }
}