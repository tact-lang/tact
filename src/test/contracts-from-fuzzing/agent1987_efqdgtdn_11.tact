struct OptionalNested {
    inner: Int?;
    flag: Bool?;
}

struct OuterOptional {
    nested: OptionalNested?;
}

contract OptionalDeep {
    data: OuterOptional;
    init() {
        self.data = OuterOptional{
            nested: OptionalNested{
                inner: null,
                flag: true
            }
        };
    }
}