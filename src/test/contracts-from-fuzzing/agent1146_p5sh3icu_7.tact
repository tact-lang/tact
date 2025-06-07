struct BigOptional {
    a: Int;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
}

contract BigOptionalTest {
    value: BigOptional;

    init() {
        self.value = BigOptional{
            a: 5,
            b: null,
            c: null,
            d: true,
            e: 42
        };
    }
}