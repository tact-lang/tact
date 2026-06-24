struct Embedded {
    info: String;
    optNum: Int?;
}

struct Container {
    id: Int;
    embedded: Embedded;
    extra: Bool?;
}

contract OptionalInside {
    data: Container;

    init() {
        self.data = Container{
            id: 42,
            embedded: Embedded { info: "info", optNum: null },
            extra: null
        };
    }
}