struct Inner {
    x: Int;
    y: Bool;
}

struct OuterOptional {
    i: Inner?;
    s: String?;
}

contract NestedOptionals {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            i: null,
            s: null,
        };
    }
}