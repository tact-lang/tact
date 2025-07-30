struct DeepOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    nested: Nested?;
}

struct Nested {
    inside: Int?;
}

contract OptionalDeep {
    s: DeepOptionals;

    init() {
        self.s = DeepOptionals{
            opt1:null, opt2:true, opt3:"a string",
            nested: Nested{inside: null}
        };
    }
}