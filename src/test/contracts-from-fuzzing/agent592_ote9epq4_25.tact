struct Packed {
    a: Int as uint4;
    b: Int as int64;
    c: Bool;
    d: Bool?;
    e: Int;
}

contract TestContract(
    p: Packed,
) {
    receive() {}
}