struct Complex_Nested {
    ai: Int?;
    bs: Bool;
}

struct MoreComplex {
    inn: Complex_Nested;
    s: String?;
    flag: Bool;
}

contract PersistentComplex {
    data: MoreComplex;

    init() {
        self.data = MoreComplex{
            inn: Complex_Nested{ ai: null, bs: false },
            s: null,
            flag: true
        };
    }
}