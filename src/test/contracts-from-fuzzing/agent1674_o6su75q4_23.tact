struct Bottom {
    text: String? = null;
    flag: Bool?;
}

struct Mid {
    count: Int?;
    details: Bottom;
}

contract MixedOptionalDefaults {
    info: Mid;

    init() {
        self.info = Mid{
            count: null,
            details: Bottom{ text: null, flag: null },
        };
    }
}