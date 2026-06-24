struct DeepNest {
    aa: Inner;
    bb: Bool;
}

struct Inner {
    innerInt: Int;
    innerAddress: Address;
    innerBool: Bool?;
}

contract TestContract {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{
            aa: Inner{
                innerInt: 7,
                innerAddress: myAddress(),
                innerBool: true,
            },
            bb: false,
        };
    }
}
