struct BoolOpts {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
}
contract TestBoolNulls {
    store: BoolOpts;

    init() {
        self.store = BoolOpts{
            f1:true,
            f2:null,
            f3:false
        };
    }
}