struct Bottom {
    secret: String?;
    lucky: Int?;
}

struct MiddleLayer {
    bottom: Bottom;
    known: Bool;
}

struct TopLevel {
    middle: MiddleLayer?;
    owner: Address;
}

contract OptDeepNest {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            middle: MiddleLayer{
                bottom: Bottom{
                    secret: null,
                    lucky: 17,
                },
                known: true,
            },
            owner: myAddress(),
        };
    }
}