struct WithOptions {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    sliceOpt: Slice?;
}

contract StructWithManyOptionals {
    s: WithOptions;

    init() {
        self.s = WithOptions{
            intOpt: null,
            boolOpt: null,
            stringOpt: null,
            sliceOpt: null
        };
    }
}