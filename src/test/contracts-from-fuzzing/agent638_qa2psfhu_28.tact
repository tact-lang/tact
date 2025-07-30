contract OptAddrNull {
    owner: Address? = null;

    init() {
        self.owner = sender();
    }

    receive() {}
}