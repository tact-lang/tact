struct IntAlias {
    x: Int as uint32;
    y: Int as int64;
}

contract SerializedIntStruct {
    data: IntAlias;
    init() {
        self.data = IntAlias{ x: 123, y: -456 };
    }
}