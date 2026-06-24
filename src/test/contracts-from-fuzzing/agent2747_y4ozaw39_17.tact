struct BoolNest {
    a: Bool;
    b: Bool;
}

struct IntNest {
    i: Int;
    bl: BoolNest;
}

contract CrossNested {
    data: IntNest;

    init() {
        self.data = IntNest{
            i: 12,
            bl: BoolNest{a:true, b:false}
        };
    }
}