struct Leaf {
    num: Int;
    text: String;
}

struct Mid {
    data: Leaf;
    note: String;
}

struct Outer {
    maybeMid: Mid?;
}

contract OptionalNestedStruct {
    storageField: Outer;

    init() {
        self.storageField = Outer{
            maybeMid: null
        };
    }
}
