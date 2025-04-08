struct OptAddrHolder {
    addr: Address?;
}

contract TestContract {
    holder: OptAddrHolder;
    init() {
        self.holder = OptAddrHolder{addr: null};
    }
}