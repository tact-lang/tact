struct IntAndOpt {
    a: Int;
    b: Int?;
}

struct Wrap {
    nested: IntAndOpt;
    maybe: IntAndOpt?;
}

contract TestContract {
    data: Wrap;
    init() {
        self.data = Wrap{
            nested: IntAndOpt{ a:1, b:null },
            maybe: null
        };
    }
}