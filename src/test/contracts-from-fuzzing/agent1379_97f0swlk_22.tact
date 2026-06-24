struct OptionalLayer {
    a: Int?;
    b: Int?;
}

struct NestOptional {
    inner: OptionalLayer?;
}

contract OptInLayer {
    nested: NestOptional;

    init() {
        self.nested = NestOptional{
            inner: OptionalLayer{
                a: 1,
                b: null
            }
        };
    }
}
