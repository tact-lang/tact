// test complex optional nested in optional nested in struct
struct Inner {
    foo: Int?;
}

struct Mid {
    bar: Inner?;
}

contract TestContract {
    nestedOpt: Mid?;

    init() {
        self.nestedOpt = Mid{
            bar: Inner{
                foo: null
            }
        };
    }
}