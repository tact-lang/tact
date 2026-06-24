struct Mid {
    foo: Int;
    bar: String;
}

struct Wrapper {
    first: Mid;
    second: Mid;
    note: String;
}

contract DeepFields {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            first: Mid{
                foo: 2,
                bar: "x",
            },
            second: Mid{
                foo: 3,
                bar: "y",
            },
            note: "all done",
        };
    }
}