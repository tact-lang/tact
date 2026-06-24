struct Mixed {
    addr: Address;
    name: String?;
}

contract TestContract {
    info: Mixed;

    init() {
        self.info = Mixed{ addr: myAddress(), name: null };
    }
}