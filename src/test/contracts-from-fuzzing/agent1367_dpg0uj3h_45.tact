struct NullsStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract SeparateNulls {
    a: NullsStruct;
    b: NullsStruct;

    init() {
        self.a = NullsStruct{ x: null, y: null, z: null };
        self.b = NullsStruct{ x: null, y: null, z: null };
    }
}