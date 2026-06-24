struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool?;
    f: Int?;
    g: String?;
    h: Address?;
}

struct Wrapped {
    nested: BigNested;
}

contract ManyNestedOptionals {
    w: Wrapped;
    init() {
        self.w = Wrapped{
            nested: BigNested{
                a: 1,
                b: true,
                c: "hi",
                d: myAddress(),
                e: null,
                f: null,
                g: null,
                h: null,
            }
        };
    }
}