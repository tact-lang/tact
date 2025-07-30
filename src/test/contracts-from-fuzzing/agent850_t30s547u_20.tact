struct Inner {
    foo: Int;
    bar: Bool;
}

struct Wrapper {
    innerOpt: Inner?;
    plainVal: Int;
}

contract PartialNestedInit {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{
            innerOpt: null,
            plainVal: 7,
        };
    }
}