struct DeepOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainsDeepOptional {
    d: DeepOptionalFields;
    e: Int;
}

contract DeepOptionalHolder {
    f: ContainsDeepOptional;

    init() {
        self.f = ContainsDeepOptional{
            d: DeepOptionalFields{
                a: null,
                b: null,
                c: null
            },
            e: 1
        };
    }
}