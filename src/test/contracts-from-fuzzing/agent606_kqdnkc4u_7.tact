struct Packed {
    x: Int as uint8;
    y: Int as int16;
    b: Bool;
}

contract Test {
    data: Packed = Packed{ x: 1, y: -100, b: true };
}