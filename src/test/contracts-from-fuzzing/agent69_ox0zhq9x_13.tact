struct Wrap {
    s: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool;
    name: String;
}

contract Wrapped {
    wrapped: Wrap;

    init() {
        self.wrapped = Wrap{
            s: Inner{
                foo: 10,
                bar: false,
                name: "n",
            },
        };
    }
}
