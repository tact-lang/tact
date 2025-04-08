struct OptNest {
    val: Int?;
    str: String?;
}

struct Top {
    a: OptNest?;
    b: Int;
}

contract OptInOpt {
    field: Top;
    init() {
        self.field = Top{
            a: null,
            b: 7
        };
    }
}