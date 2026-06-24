struct WrapAddrStr {
    addr: Address;
    strField: String;
}

contract StructSerialization {
    wa: WrapAddrStr;

    init() {
        self.wa = WrapAddrStr{ addr: myAddress(), strField: "hi" };
    }
}