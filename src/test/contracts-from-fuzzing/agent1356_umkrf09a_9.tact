struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

struct Wrap {
    inner: DeepOpt?;
    txt: String;
}

contract NestedOptionals {
    s: Wrap;
    
    init() {
        self.s = Wrap{
            inner: null,
            txt: "init"
        };
    }
}
