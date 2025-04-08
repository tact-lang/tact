struct SA {
    addr: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
}

contract NestedAddr {
    data: SA = SA{};
    receive() {}
}
