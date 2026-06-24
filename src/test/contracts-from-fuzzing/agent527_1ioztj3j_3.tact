struct RecOptional {
    i: Int?;
    b: Bool?;
    s: String?;
    nested: Inner?;
}

struct Inner {
    j: Int;
    text: String;
}

contract OptionalStructsStorage {
    data: RecOptional;

    init() {
        self.data = RecOptional{
            i: null,
            b: null,
            s: null,
            nested: null,
        };
    }
}