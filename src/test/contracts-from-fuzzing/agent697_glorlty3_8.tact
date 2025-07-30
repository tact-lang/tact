struct DeeplyOptional {
    a: Int?;
    b: String?;
}

struct MidOptional {
    dee: DeeplyOptional?;
    c: Bool;
}

contract ManyOptionals {
    optNested: MidOptional?;

    init() {
        self.optNested = null;
    }
}