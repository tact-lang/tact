struct NullableStruct {
    val: Int?;
}

contract NullableInStruct {
    s: NullableStruct = NullableStruct{val:null};
    init() {
        self.s = NullableStruct{val:null};
    }
}