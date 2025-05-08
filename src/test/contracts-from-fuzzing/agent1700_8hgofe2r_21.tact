struct OptAddr {
    addr: Address?;
}

contract TestContract {
    opty: OptAddr;

    init() {
        self.opty = OptAddr{addr:null};
    }
}