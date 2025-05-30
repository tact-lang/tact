struct Succ {
    n: Int;
}

struct WrapOpt {
    so: Succ?;
}

contract OptionalStructField {
    field: WrapOpt;

    init() {
        self.field = WrapOpt{
            so: null
        };
    }
}