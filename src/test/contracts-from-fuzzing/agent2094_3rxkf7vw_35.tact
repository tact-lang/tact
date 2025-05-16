struct OptAddr {
    a: Address? = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
}

contract StructOptAddr {
    data: OptAddr = OptAddr{};
    receive() {}
}
