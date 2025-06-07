message MaybeAddress {
    addr: Address?;
}

contract Test {
    receive() {
        let a = MaybeAddress{addr: null};
    }
}