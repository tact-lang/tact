struct Layered {
    level: Int;
    lower: Nested?;
}

struct Nested {
    foo: Int;
    bar: Bool;
}

contract OptionalNestedField {
    layer: Layered;

    init() {
        self.layer = Layered{
            level:1,
            lower:Nested{foo:2,bar:true},
        };
    }
}