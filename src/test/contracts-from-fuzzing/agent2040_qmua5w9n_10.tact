struct NullableStruct {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract ManyNullables {
    data: NullableStruct;

    init() {
        self.data = NullableStruct{ val1:null, val2:null, val3:null };
    }
}
