struct Mixture {
    intVal: Int;
    optInt: Int?;
    boolVal: Bool;
    optBool: Bool?;
    addr: Address;
    optAddr: Address?;
}

contract TestContract {
    m: Mixture;

    init() {
        self.m = Mixture{
            intVal: 7,
            optInt: null,
            boolVal: false,
            optBool: null,
            addr: myAddress(),
            optAddr: null,
        };
    }

    receive() {
        let _ = self.m.intVal;
        let _ = self.m.optInt;
        let _ = self.m.boolVal;
        let _ = self.m.optBool;
        let _ = self.m.addr;
        let _ = self.m.optAddr;
    }
}