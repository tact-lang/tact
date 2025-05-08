struct InnerOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct OuterOptional {
    inner: InnerOptional?;
}

contract FullyOptionalNested {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            inner: InnerOptional{
                x: null,
                y: true,
                z: null
            }
        };
    }
}