// Struct with explicitly serialized ints
struct Packed {
    x: Int as uint4;
    y: Int as uint12;
    z: Int as int16;
}

contract Compact {
    f: Packed = Packed{ x: 3, y: 4095, z: -32768 };
    init() {}
}