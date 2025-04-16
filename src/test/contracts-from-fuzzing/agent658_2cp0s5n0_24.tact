struct Inner1 { a: Int }
struct Inner2 { a: Int }
struct WithOptionals {
    i1: Inner1?;
    i2: Inner2?;
    extra: Int?;
}

contract OptionalNestedFields {
    f: WithOptionals;

    init() {
        self.f = WithOptionals{
            i1: null,
            i2: null,
            extra: null
        };
    }
}