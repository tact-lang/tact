struct DeepOptional {
    a: Int?;
    b: String?;
}

struct Mid {
    c: Bool;
    d: DeepOptional;
}

contract NestedOptionals {
    storage: Mid?;

    init() {
        self.storage = Mid{
            c: true,
            d: DeepOptional{a:null,b:null}
        };
    }
}