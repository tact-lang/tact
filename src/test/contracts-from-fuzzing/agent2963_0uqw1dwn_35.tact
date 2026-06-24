struct HasOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: HasOpt?;
    other: Int?;
}

contract OptInStructs {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: HasOpt{
                a: null,
                b: true
            },
            other: null
        };
    }
}
