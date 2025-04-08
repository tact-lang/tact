struct MiddleOptional {
    inner: Int?;
}
struct OuterOptional {
    nested: MiddleOptional?;
}

contract MultiNulls {
    data: OuterOptional;

    init() {
        self.data = OuterOptional {
            nested: null
        };
    }
}