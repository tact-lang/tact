struct Nullable {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
}

struct WrapNullable {
    inner: Nullable?;
}

contract OptWrap {
    field: WrapNullable;

    init() {
        self.field = WrapNullable{
            inner: null
        };
    }
}