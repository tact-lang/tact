struct OptAddrStruct {
    addr: Address? = null;
}

contract Test19 {
    s: OptAddrStruct;

    init() {
        self.s = OptAddrStruct{};
    }

    receive() {}
}