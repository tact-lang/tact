struct AddressHolder {
    addr1: Address;
    addr2: Address?;
    addr3: Address;
    addr4: Address?;
}

contract TestContract {
    addrs: AddressHolder;
    
    init() {
        self.addrs = AddressHolder{
            addr1: myAddress(),
            addr2: null,
            addr3: myAddress(),
            addr4: null
        };
    }
}