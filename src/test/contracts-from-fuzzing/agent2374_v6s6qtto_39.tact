struct RefOptStruct {
    a: Address?;
    c: Cell?;
    s: Slice?;
}

contract WrappedRefOpts {
    d: RefOptStruct;

    init() {
        self.d = RefOptStruct{ a:null, c:null, s:null };
    }
}