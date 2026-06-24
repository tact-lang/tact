struct Foo {
    address: Address;
}

contract Test {
    receive() {
        let a: Address = address("0:0000000000000000000000000000000000000000000000000000000000000000");
        let f = Foo{ address: a };
    }
}