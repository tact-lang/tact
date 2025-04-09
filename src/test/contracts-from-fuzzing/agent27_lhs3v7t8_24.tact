message AddressMsg {
    addr: Address;
}

contract Test {
    receive(m: AddressMsg) {
        let a = m.addr;
    }
}