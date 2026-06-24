struct ManyOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: String?;
    g: Bool?;
    h: Address?;
}

contract OptionalFieldsTest {
    data: ManyOptional;
    init() {
        self.data = ManyOptional{
            a: 1,
            b: null,
            c: 3,
            d: null,
            e: 5,
            f: "hello",
            g: true,
            h: null
        };
    }
}