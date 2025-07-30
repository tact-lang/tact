struct DeepOptionalNest {
    a: Int?;
    b: StructLevel1?;
}

struct StructLevel1 {
    x: Bool?;
    y: StructLevel2?;
}

struct StructLevel2 {
    s: String?;
    inner: StructLevel3?;
}

struct StructLevel3 {
    f: Int;
}

contract DeepOptionals {
    storage: DeepOptionalNest;

    init() {
        self.storage = DeepOptionalNest{
            a: null,
            b: null
        };
    }
}