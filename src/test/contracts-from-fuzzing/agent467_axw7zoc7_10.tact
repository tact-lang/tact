struct OptionalStructs {
    s1: S?;
    s2: S?;
}

struct S {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    data: OptionalStructs;

    init() {
        self.data = OptionalStructs{
            s1: S{ x: null, y: true },
            s2: null,
        };
    }
}