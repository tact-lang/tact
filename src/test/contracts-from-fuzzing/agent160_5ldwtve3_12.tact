struct OptionalNested {
    s1: Inner1?;
}

struct Inner1 {
    s2: Inner2?;
}

struct Inner2 {
    value: Int;
}

contract TestNestedOptionals {
    val: OptionalNested;
    init() {
        self.val = OptionalNested{
            s1: null,
        };
    }
}