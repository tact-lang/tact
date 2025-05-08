struct OptionalNest {
    val1: Int?;
    val2: Int?;
}

struct Outer {
    sub: OptionalNest?;
}

contract OptionalDeep {
    field: Outer;
    init() {
        self.field = Outer{sub: null};
    }
}