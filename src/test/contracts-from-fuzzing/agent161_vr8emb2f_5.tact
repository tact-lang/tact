struct NestedOptional {
    inner: Int?;
    flag: Bool;
}

struct Outer {
    n1: NestedOptional;
    n2: NestedOptional?;
}

contract TestNestedOptionals {
    state: Outer;

    init() {
        self.state = Outer{
            n1: NestedOptional{
                inner: 5,
                flag: true,
            },
            n2: null,
        };
    }
}
