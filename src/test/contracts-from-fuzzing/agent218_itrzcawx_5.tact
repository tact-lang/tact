struct NestedOptionals {
    maybeInner: Inner?;
}

struct Inner {
    number: Int?;
    flag: Bool?;
}

contract OptionalNestedStruct {
    payload: NestedOptionals;

    init() {
        self.payload = NestedOptionals{
            maybeInner: Inner{
                number: null,
                flag: true
            }
        };
    }
}