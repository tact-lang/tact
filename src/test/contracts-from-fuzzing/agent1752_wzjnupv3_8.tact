struct Serialized {
    x: Int as uint32;
    y: Int as int64;
    z: Bool;
}

contract HasSerialization {
    s: Serialized = Serialized{ x: 123, y: -123, z: true };
}