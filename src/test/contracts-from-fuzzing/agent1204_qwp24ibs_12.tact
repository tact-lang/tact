// Struct with nested optionals containing primitive fields
struct DeepOptionals {
    a: Int?;
    b: Bool?;
}

struct NestOptional {
    nested: DeepOptionals?;
}

contract NestedOptPrim {
    d: NestOptional;

    init() {
        self.d = NestOptional{
            nested: null
        };
    }
}