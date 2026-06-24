message AddressMessage {
    addr: Address;
}

contract Test {
    receive(msg: AddressMessage) {
        let a = msg.addr;
    }
}