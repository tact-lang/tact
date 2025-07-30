struct NestedOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
}

struct TopStruct {
    nopt: NestedOptionals?;
    z: Int;
    t: String;
}

contract OptionalStructs {
    store: TopStruct;

    init() {
        self.store = TopStruct{
            nopt: NestedOptionals{
                x: 77,
                y: null,
                s: "str",
            },
            z: 5,
            t: "hi",
        };
    }
}
