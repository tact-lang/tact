struct ComboNestOpt {
    inner: Inner?
}

struct Inner {
    a: Int?;
    b: Bool?;
}

contract NestedCombo {
    s: ComboNestOpt;
    init() {
        self.s = ComboNestOpt{
            inner: Inner{ a:null, b:true }
        };
    }
}