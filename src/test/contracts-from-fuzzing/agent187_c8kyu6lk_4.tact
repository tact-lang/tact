struct SOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract StorageOptionalFieldsTest {
    data: SOptional;

    init() {
        self.data = SOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}