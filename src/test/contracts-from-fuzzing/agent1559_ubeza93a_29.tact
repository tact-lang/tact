contract SerializeIntEdges {
    max_uint8: Int as uint8;
    min_int8: Int as int8;

    init() {
        self.max_uint8 = 255;
        self.min_int8 = -128;
    }
}