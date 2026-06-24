contract TestAddressContract {
    addr: Address;

    init() {
        self.addr = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    }

    get fun getAddr() : String {
        return self.addr.toString();
    }
}
