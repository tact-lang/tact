struct InnerStruct {
    f1: Int;
    f2: Bool;
}

struct OuterStruct {
    a: InnerStruct;
    b: InnerStruct;
    c: InnerStruct;
}

contract ThreeNestedStructsTest {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{
            a: InnerStruct{f1:1,f2:true},
            b: InnerStruct{f1:2,f2:false},
            c: InnerStruct{f1:3,f2:true}
        };
    }
}