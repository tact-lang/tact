struct Inner {
    a: Int;
}

struct OuterOpt {
    field: Inner?;
}

contract OptionalWrapper {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            field: null
        };
    }
}