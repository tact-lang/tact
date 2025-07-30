contract OptionAddress {
    myAddr: Address?;

    init(addr: Address?) {
        self.myAddr = addr;
    }

    get fun getAddr(): Address? {
        return self.myAddr;
    }
}
