// Deep nesting with optionals in inner struct
struct InnerOpt {
    a: Int?;
    b: Bool;
}

struct OuterOpt {
    inner: InnerOpt?;
    label: String;
}

contract OptionalInsideNested {
    x: OuterOpt;

    init() {
        self.x = OuterOpt{
            inner: null,
            label: "ok",
        };
    }
}
