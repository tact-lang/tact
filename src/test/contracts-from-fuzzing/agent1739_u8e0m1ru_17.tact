struct ContainsNullable {
    a: Int?;
    b: String?;
}

contract NullableStructField {
    inner: ContainsNullable?;

    init() {
        self.inner = ContainsNullable{
            a: 17,
            b: "hi",
        };
    }
}