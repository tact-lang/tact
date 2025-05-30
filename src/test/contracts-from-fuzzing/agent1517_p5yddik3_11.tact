struct Packed {
    small: Int as uint8;
    flag: Bool;
}

contract Test(
    packed: Packed,
    count: Int as int16,
    enabled: Bool,
) {
    receive() {}
}