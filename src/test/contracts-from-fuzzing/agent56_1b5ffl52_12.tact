struct SOptionalEmbedded {
    name: String?;
    flag: Bool?;
    number: Int?;
}

struct Container {
    inner: SOptionalEmbedded;
    active: Bool;
}

contract OptionalEmbedTest {
    data: Container;

    init() {
        self.data = Container{
            inner: SOptionalEmbedded{
                name: null,
                flag: null,
                number: 123,
            },
            active: true,
        };
    }
}