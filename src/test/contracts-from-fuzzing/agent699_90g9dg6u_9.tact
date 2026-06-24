struct MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    p: Bool?;
    q: String?;
}

contract ComboPersistent {
    field: MixedTypes;

    init() {
        self.field = MixedTypes{
            i: 1,
            b: true,
            s: "abc",
            o: 99,
            p: null,
            q: null
        };
    }
}
