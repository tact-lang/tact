struct Inner { val: Int; }

struct OuterOpt {
    a: Inner?;
    b: Inner?;
}

contract OptionalStructFields {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            a: null,
            b: null,
        };
    }
}