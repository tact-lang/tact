struct Nested {
    s: String;
    inneropt: Int?;
}

struct Cont {
    nested: Nested;
    intopt: Int?;
}

contract MixedOpts {
    val: Cont;
    init() {
        self.val = Cont{
            nested: Nested{ s:"A", inneropt:null },
            intopt: null
        };
    }
}