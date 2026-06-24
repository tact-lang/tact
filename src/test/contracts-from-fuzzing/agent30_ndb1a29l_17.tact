struct HasAddress {
    addr: Address;
}

contract TestContract {
    receive() {
        let h = HasAddress{ addr: address("0:0000000000000000000000000000000000000000000000000000000000000000") };
    }
}