contract SerializedSerializationEdge {
    int8val: Int as int8;
    int16val: Int as int16;
    int64val: Int as int64;
    uint4val: Int as uint4;

    init() {
        self.int8val = 1;
        self.int16val = 2;
        self.int64val = 3;
        self.uint4val = 4;
    }
}