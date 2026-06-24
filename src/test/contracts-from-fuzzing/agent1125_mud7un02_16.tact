struct Outer {
    nested: Inner;
}

struct Inner {
    deeply: Deeper;
}

struct Deeper {
    innermost: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                deeply: Deeper{
                    innermost: 777,
                },
            },
        };
    }
}