struct Complex {
    id: Int;
    info: Info;
}

struct Info {
    status: Bool;
    description: String;
    optionalField: SubInfo?;
}

struct SubInfo {
    data: Cell;
    remarks: String?;
}

contract ComplexStorage {
    c: Complex;

    init() {
        self.c = Complex{
            id: 1,
            info: Info{
                status: true,
                description: "desc",
                optionalField: SubInfo{
                    data: emptyCell(),
                    remarks: null,
                },
            },
        };
    }
}
