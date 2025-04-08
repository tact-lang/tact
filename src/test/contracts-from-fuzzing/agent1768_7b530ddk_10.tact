struct OptionalNested {
    maybeInt: Int?;
    maybeInner: Inner?;
}

struct Inner {
    flag: Bool;
    text: String;
}

contract TestStorage {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            maybeInt: null,
            maybeInner: null
        };
    }
}