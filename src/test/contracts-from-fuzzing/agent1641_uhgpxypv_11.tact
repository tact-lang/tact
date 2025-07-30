struct Base {
    a: Int;
    b: Bool;
}

struct Extended {
    base: Base;
    val: Int;
}

struct Big {
    e1: Extended;
    e2: Extended;
    b1: Base;
    b2: Base;
}

contract TestContract {
    field: Big;

    init() {
        self.field = Big{
            e1: Extended{base: Base{a:1,b:true}, val:5},
            e2: Extended{base: Base{a:2,b:false}, val:6},
            b1: Base{a:3,b:true},
            b2: Base{a:4,b:false}
        };
    }
}