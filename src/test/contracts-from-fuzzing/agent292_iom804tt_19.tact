struct OptNest {
    s: Inner?;
}

struct Inner {
    a: Int?;
    b: Bool?;
}

contract OptionInNested {
    opt: OptNest;

    init() {
        self.opt = OptNest{ s: Inner{ a:null, b:true } };
    }
}