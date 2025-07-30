struct NestedOptional {
    foo: Inner1?;
    bar: Inner2?;
}

struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
}

contract OptionalNestedStructs {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ foo: null, bar: null };
    }
}