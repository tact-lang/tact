// test slice and address optionals together
contract SliceAddrOpt {
    s: Slice?;
    a: Address?;

    init() {
        self.s = null;
        self.a = null;
    }
}