struct MixOptionalNest {
    value: Int?;
    nested: Struct1?;
}
struct Struct1 {
    foo: Bool?;
    bar: Struct2?;
}
struct Struct2 {
    x: Int?;
}

contract OptionalChaos {
    store: MixOptionalNest;
    init() {
        self.store = MixOptionalNest{
            value:null,
            nested:null
        };
    }
}