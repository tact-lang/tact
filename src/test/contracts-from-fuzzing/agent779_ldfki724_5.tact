struct Opts {
    one: Int?;
    two: Bool?;
    three: Int?;
    four: Bool?;
}

struct Outer {
    inner: Opts;
    num: Int;
}

contract NestedOptionals {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Opts{
                one: null,
                two: null,
                three: 5,
                four: true
            },
            num: 100
        };
    }
}