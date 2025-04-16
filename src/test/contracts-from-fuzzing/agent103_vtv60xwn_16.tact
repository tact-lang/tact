struct A {
    s: String;
    i: Int?;
    b: Bool = true;
}

struct B {
    nested: A?;
    f: Bool;
}

contract OptionalWithDefaults {
    data: B;

    init() {
        self.data = B{
            nested: null,
            f: false
        };
    }
}