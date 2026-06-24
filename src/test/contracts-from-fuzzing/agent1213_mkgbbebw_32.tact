struct InnerStruct {
    x: Int as uint8;
    y: Int as int16;
    z: Int as uint32;
}

contract StorageWithSerializedStruct {
    s: InnerStruct;

    init() {
        self.s = InnerStruct { x:1, y:2, z:3 };
    }
}