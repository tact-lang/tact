struct LeafStruct { a: Int; }

struct MidStructA { l: LeafStruct; }
struct MidStructB { l: LeafStruct; }
struct OuterStruct {
    a: MidStructA;
    b: MidStructB;
}

contract SharedNestedStructs {
    fld: OuterStruct;

    init() {
        self.fld = OuterStruct{
            a: MidStructA{ l: LeafStruct{a:1} },
            b: MidStructB{ l: LeafStruct{a:2} }
        };
    }
}
