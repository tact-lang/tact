struct MultiBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract NestedMultiBool {
    mb: MultiBool;

    init() {
        self.mb = MultiBool{
            a: true,
            b: false,
            c: true,
            d: false
        };
    }
}
