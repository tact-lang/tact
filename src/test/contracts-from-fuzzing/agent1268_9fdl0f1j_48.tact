// Struct with nested optional, with default null
struct Deep {
    inner: Int?;
}

struct OuterOpt {
    d: Deep?;
}

contract OptOptStruct {
    f: OuterOpt;

    init() {
        self.f = OuterOpt{
            d: null,
        };
    }
}