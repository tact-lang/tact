// Many serialization specifiers
struct ManySer {
    v1: Int as int16;
    v2: Int as uint3;
    v3: Int as int8;
    v4: Int as uint1;
    v5: Int as uint32;
    v6: Int as int4;
}

contract ManySerializationFormats {
    s: ManySer;

    init() {
        self.s = ManySer{ v1:-4, v2:7, v3:-8, v4:1, v5:32, v6:-1 };
    }
}