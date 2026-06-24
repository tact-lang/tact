struct InnerS {
    a: Int?;
    b: Bool?;
}

contract OptStructNullableFields {
    data: InnerS?;

    init() {
        self.data = null;
    }
}