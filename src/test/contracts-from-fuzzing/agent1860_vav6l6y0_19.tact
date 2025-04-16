struct Packed {
    v1: Int as uint8;
    v2: Int as uint8;
    v3: Int as uint8;
    v4: Int as uint8;
    v5: Int as uint8;
    v6: Int as uint8;
    v7: Int as uint8;
    v8: Int as uint8;
}

contract SerializedPacked {
    data: Packed = Packed{ v1:1,v2:2,v3:3,v4:4,v5:5,v6:6,v7:7,v8:8 };
}