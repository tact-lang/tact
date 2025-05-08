struct SerializeInts {
    x: Int as int64;
    y: Int as int8;
    z: Int as uint4;
}

contract SerializeIntTest {
    s: SerializeInts = SerializeInts{ x:42, y:-5, z:7 };
}