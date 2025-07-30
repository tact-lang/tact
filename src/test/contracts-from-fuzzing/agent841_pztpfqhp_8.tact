struct Param {
    intVal: Int;
    boolVal: Bool;
    textVal: String;
    addr: Address;
}

contract AllPrimitives {
    p: Param;
    init() {
        self.p = Param{
            intVal: 7, boolVal:true, textVal:"hi", addr: myAddress()
        };
    }
}
