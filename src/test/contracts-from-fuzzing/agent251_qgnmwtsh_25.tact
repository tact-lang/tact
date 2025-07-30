struct NullableSerialize {
    a: Int? as uint8;
    b: Int? as uint16;
}

contract SerializeNullable {
    data: NullableSerialize;

    init() {
        self.data = NullableSerialize{ a:null, b:null };
    }
}