struct Base {
    a: Int;
    b: Bool;
}

struct MidOpt {
    base1: Base?;
    base2: Base?;
}

contract StructWithDoubleOption {
    nested: MidOpt?;

    init() {
        self.nested = MidOpt{
            base1: Base{a:1,b:true},
            base2: null
        };
    }
}