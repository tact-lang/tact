struct SerializeFormats {
    val1: Int as int64;
    val2: Int as uint4;
    val3: Int as coins;
}

contract SerializationAnnotated {
    data: SerializeFormats;
    init() {
        self.data = SerializeFormats{val1: 1, val2: 2, val3: 3};
    }
}