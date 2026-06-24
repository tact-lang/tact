struct OptionalWithSerialize {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract OptSerializeFields {
    data: OptionalWithSerialize;

    init() {
        self.data = OptionalWithSerialize{val1:null, val2:null, val3:null};
    }
}