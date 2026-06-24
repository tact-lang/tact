struct InnerStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    x: Int;
    nested: InnerStruct;
    optionalNested: InnerStruct?;
}

contract StructOptCombo {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{
            x: 9,
            nested: InnerStruct{ a:1,b:true },
            optionalNested: null,
        };
    }
}