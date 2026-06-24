struct NestedPrimOpt {
    s: String?;
}

contract PrimOptContract {
    x: Int = 5;
    nested: NestedPrimOpt;

    init() {
        self.x = 10;
        self.nested = NestedPrimOpt{ s:null };
    }
}