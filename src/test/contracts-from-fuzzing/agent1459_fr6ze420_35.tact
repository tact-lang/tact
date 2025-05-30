// test nested optionals inside persistent fields rather than params
struct NestedOpt {
    foo: String?;
    bar: Bool?;
}

contract PersistNestedOpt {
    x: NestedOpt?;

    init() {
        self.x = null;
    }
}
