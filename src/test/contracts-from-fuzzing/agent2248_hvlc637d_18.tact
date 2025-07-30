struct A {
    x: Int;
    y: Bool?;
}

struct B {
    inner: A?;
    comment: String;
}

contract OptionalDeep {
    b: B?;

    init() {
        self.b = B{
            inner: A{ x: 42, y: null },
            comment: "done"
        };
    }
}