struct Inner {
    foo: Int;
}

struct Outer {
    innerOption: Inner?;
}

contract OptionalStructInsideStruct {
    data: Outer;

    init() {
        self.data = Outer{ innerOption: null };
    }
}