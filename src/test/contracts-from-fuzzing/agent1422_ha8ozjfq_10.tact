struct NestedOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    x: NestedOpt?;
    y: String?;
}

contract NullableStructs {
    f: OuterOpt;

    init() {
        self.f = OuterOpt{
            x: null,
            y: null,
        };
    }
}