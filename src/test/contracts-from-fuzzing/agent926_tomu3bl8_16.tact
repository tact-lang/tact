struct InnerOption {
    foo: Int?;
    bar: Bool?;
}

struct MiddleOption {
    io1: InnerOption?;
    io2: InnerOption?;
}

struct OuterOption {
    mid1: MiddleOption?;
    mid2: MiddleOption?;
}

contract TestContract {
    nestedOpt: OuterOption;

    init() {
        self.nestedOpt = OuterOption{
            mid1: MiddleOption{
                io1: null,
                io2: null
            },
            mid2: null
        };
    }
}