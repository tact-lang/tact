struct RefTypes {
    s1: String;
    s2: String?;
    sl1: Slice;
    sl2: Slice?;
    addr: Address;
    addrOpt: Address?;
}

contract TestContract {
    rt: RefTypes;

    init() {
        self.rt = RefTypes{
            s1: "hello",
            s2: null,
            sl1: emptyCell().asSlice(),
            sl2: null,
            addr: myAddress(),
            addrOpt: null,
        };
    }
}