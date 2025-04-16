struct One {
    a: Int;
}

struct Two {
    b: Int?;
    a: One;
}

struct Three {
    c: Two;
    d: Bool?;
}

contract MixNestedFields {
    val: Three;

    init() {
        self.val = Three{
            c: Two{ b: null, a: One{a:1}},
            d: true
        };
    }
}
