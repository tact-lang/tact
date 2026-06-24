struct InnerS {
    foo: Int?;
    bar: Bool;
}

struct MidS {
    inn: InnerS?;
    text: String;
}

contract OptionalNestedStruct {
    mid: MidS?;

    init() {
        self.mid = null;
    }
}