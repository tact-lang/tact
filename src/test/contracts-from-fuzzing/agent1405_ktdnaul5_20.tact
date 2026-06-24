struct SerializeStruct {
    x: Int as uint4;
    y: Int as int8;
}

contract StructWithSerializedFields {
    data: SerializeStruct;

    init() {
        self.data = SerializeStruct{ x:7, y:-5 };
    }
}