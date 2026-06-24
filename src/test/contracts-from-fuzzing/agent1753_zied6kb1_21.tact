struct Inner {
    foo: Int;
}

struct Outer {
    bar: Inner;
}

contract OptionalOfStruct {
    data: Outer?;

    init() {
        self.data = null;
    }
}