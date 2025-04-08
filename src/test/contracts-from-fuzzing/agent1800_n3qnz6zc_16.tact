struct NestedOpts {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    inner: NestedOpts?;
    z: String?;
}

contract NestedOptionalStructs {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: NestedOpts{
                x: 42,
                y: null
            },
            z: null
        };
    }
}