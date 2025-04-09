struct Mixed {
    mandatory: Inner;
    optional: Inner?;
}

struct Inner {
    num: Int;
    flag: Bool?;
}

contract TestContract {
    field: Mixed;

    init() {
        self.field = Mixed{
            mandatory: Inner{ num:5, flag:null },
            optional: null
        };
    }
}