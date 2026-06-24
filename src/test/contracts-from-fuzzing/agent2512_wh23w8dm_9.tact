struct StructA {
    one: Int;
    two: Bool;
}

struct StructB {
    refA: StructA;
    optA: StructA?;
    str: String;
}

contract NestedMixedOptionals {
    val: StructB;
    
    init() {
        self.val = StructB{
            refA: StructA{ one:0, two:true },
            optA: null,
            str: "hi"
        };
    }
}