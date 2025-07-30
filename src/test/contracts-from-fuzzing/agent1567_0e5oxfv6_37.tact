struct OuterStruct {
    nested1: Nested1;
    nested2: Nested2;
}

struct Nested1 {
    flag: Bool;
    optInt: Int?;
}

struct Nested2 {
    str: String;
    optBool: Bool?;
}

contract MultiNest {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{
            nested1: Nested1{ flag:true, optInt:null },
            nested2: Nested2{ str:"hi", optBool:null }
        };
    }
}