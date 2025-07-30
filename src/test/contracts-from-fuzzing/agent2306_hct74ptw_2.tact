struct WithOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
    nested: AnotherStruct?;
}

struct AnotherStruct {
    q: Int;
}

contract OptionalFieldStorage {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            x: null,
            y: true,
            s: null,
            nested: null
        };
    }
}
