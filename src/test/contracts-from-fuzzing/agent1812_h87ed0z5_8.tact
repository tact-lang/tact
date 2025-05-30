struct OptionalDeep {
    a: Int?;
    b: Inner?;
}

struct Inner {
    c: Int?;
    d: Bool?;
    e: StrLevel?;
}

struct StrLevel {
    s: String?;
}

contract OptionalDeepContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            a: null,
            b: null
        };
    }
}