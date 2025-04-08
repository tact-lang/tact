struct Inner {
    a: Int;
    b: Int;
}

struct Wrapper {
    first: Inner;
    second: Inner;
    maybe: Int?;
}

contract OptionalWithNestedMulti {
    wrap: Wrapper?;

    init() {
        self.wrap = Wrapper{
            first: Inner{a:1,b:2},
            second: Inner{a:3,b:4},
            maybe: null
        };
    }
}
