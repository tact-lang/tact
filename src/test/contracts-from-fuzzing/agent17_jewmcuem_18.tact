message Data {
    info: Slice
}

contract Test {
    receive(msg: Data) {}
}