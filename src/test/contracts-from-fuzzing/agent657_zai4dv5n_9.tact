struct Inner {
    foo: Int;
}

struct OuterOptional {
    nested: Inner?;
}

contract TestContract {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            nested: null
        };
    }
}