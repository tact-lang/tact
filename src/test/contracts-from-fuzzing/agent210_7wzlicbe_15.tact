struct SOpt {
    a: Int?;
    b: Bool?;
}

struct WrapOpt {
    opt: SOpt?;
}

contract NullableStructField {
    field: WrapOpt;

    init() {
        self.field = WrapOpt { opt: null };
    }
}