struct OptAddrStruct {
    addr: Address?;
    flag: Bool;
}

contract TestContract {
    data: OptAddrStruct;

    init() {
        self.data = OptAddrStruct{
            addr: null,
            flag: true
        };
    }
}