struct ManyNestedOptionals {
    a: Int?;
    b: Inner?;
}

struct Inner {
    c: Int?;
    d: Core?;
}

struct Core {
    e: Bool?;
    f: String?;
}

contract DeepOptionalNest {
    store: ManyNestedOptionals;
    init() {
        self.store = ManyNestedOptionals{
            a: null,
            b: null
        };
    }
}