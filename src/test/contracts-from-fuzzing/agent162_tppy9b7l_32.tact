struct InnerOpt {
    optval: Int?;
}

contract NestedOptionalInStruct {
    s: InnerOpt;
    init() {
        self.s = InnerOpt{
            optval: 808,
        };
    }
}