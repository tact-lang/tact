struct Mid {
    intField: Int;
    boolField: Bool;
}

struct Big {
    f1: Mid;
    f2: Mid;
    f3: Mid;
    f4: Mid;
    f5: Mid;
    f6: Mid;
    f7: Mid;
}

contract LargeNestedStruct {
    data: Big;

    init() {
        self.data = Big{
            f1: Mid{intField:1,boolField:true},
            f2: Mid{intField:2,boolField:false},
            f3: Mid{intField:3,boolField:true},
            f4: Mid{intField:4,boolField:false},
            f5: Mid{intField:5,boolField:true},
            f6: Mid{intField:6,boolField:false},
            f7: Mid{intField:7,boolField:true}
        };
    }
}