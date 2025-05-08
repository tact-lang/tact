struct Sizes {
    a: Int as int64;
    b: Int as uint256;
}

contract SerializationHints {
    field: Sizes;

    init() {
        self.field = Sizes{
            a: 12345,
            b: 67890
        };
    }
}