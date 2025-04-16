struct NullableStruct {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract Container {
    val: NullableStruct;
    init() {
        self.val = NullableStruct{
            a: null,
            b: null,
            c: null,
        };
    }
}