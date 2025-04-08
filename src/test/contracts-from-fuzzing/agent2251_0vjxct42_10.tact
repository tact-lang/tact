struct InnerA { val: Int; }
struct InnerB { val: Int; }

struct OuterStruct {
    a: InnerA;
    b: InnerB;
}

contract MultipleNestedStructs {
    field: OuterStruct;

    init() {
        self.field = OuterStruct{
            a: InnerA{val: 11},
            b: InnerB{val: 22},
        };
    }
}