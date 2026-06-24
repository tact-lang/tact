struct Coordinates {
    x: Int;
    y: Int;
}

struct Metadata {
    id: Int;
    name: String;
    info: String;
}

struct Complex {
    coo: Coordinates;
    meta: Metadata;
    description: String;
    flag: Bool;
    number: Int;
    optMeta: Metadata?;
}

contract MultiLayer {
    persist: Complex;

    init() {
        self.persist = Complex{
            coo: Coordinates{ x: 100, y: 200 },
            meta: Metadata{ id: 1, name: "Alpha", info: "Data" },
            description: "Test",
            flag: true,
            number: 999,
            optMeta: null
        };
    }
}