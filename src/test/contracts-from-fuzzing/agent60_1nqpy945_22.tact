struct NestedBool {
    b1: Bool;
    nested: BoolStruct;
}

struct BoolStruct {
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract TestContract {
    f: NestedBool;

    init() {
        self.f = NestedBool{
            b1: true,
            nested: BoolStruct{
                b2:true,
                b3:false,
                b4:true
            }
        };
    }
}