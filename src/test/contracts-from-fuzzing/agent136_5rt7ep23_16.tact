struct EmptyOptionals {
    v1: Int?;
    v2: Bool?;
}

contract InitNulls {
    f: EmptyOptionals;

    init() {
        self.f = EmptyOptionals{
            v1: null,
            v2: null,
        };
    }
}