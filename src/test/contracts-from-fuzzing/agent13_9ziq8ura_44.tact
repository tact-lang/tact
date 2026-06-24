struct NullableStruct {
    a: Int?;
    b: Bool?;
}

contract NullableStructsContract {
    x: NullableStruct?;
    y: NullableStruct?;

    init() {
        self.x = null;
        self.y = null;
    }
}