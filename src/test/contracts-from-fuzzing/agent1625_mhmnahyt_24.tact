struct LargeNested {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
    z: Int?;
}

contract LargeNestedStruct {
    value: LargeNested;

    init() {
        self.value = LargeNested{
            a: Inner{x:1, y:true, z:null},
            b: Inner{x:2, y:false, z:3},
            c: Inner{x:4, y:true, z:null},
            d: Inner{x:5, y:false, z:6},
        };
    }
}
