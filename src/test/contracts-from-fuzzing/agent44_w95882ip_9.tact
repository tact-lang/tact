contract TestContract {
    addrOpt: Address?;

    init() {
        self.addrOpt = null;
    }

    receive() {
        if (self.addrOpt != null) {
            let _ = self.addrOpt!!;
        }
    }
}