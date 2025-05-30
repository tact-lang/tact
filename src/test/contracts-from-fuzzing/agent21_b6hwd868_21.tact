struct InnerOptional {
    a: Int?;
    b: Int?;
}

struct OuterOptional {
    x: InnerOptional?;
    y: Int;
}

contract NestedOptionals {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            x: null,
            y: 10
        };
    }
}