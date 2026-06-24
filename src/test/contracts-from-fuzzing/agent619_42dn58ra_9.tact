struct Params {
    intVal: Int = 10;
    boolVal: Bool = false;
    optVal: Int?;
    strVal: String = "hello";
    nested: Nested;
}

struct Nested {
    innerVal: Int = 42;
}

contract MixDefaults {
    param: Params;

    init() {
        self.param = Params{
            optVal: null,
            nested: Nested{},
        };
    }
}