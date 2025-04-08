struct InnerStructA {
    a: Int;
}
struct InnerStructB {
    b: Bool;
}

struct OuterStruct {
    sA: InnerStructA;
    sB: InnerStructB;
    c: Int;
}

contract MultipleNestedStructs {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            sA: InnerStructA{ a: 1 },
            sB: InnerStructB{ b: false },
            c: 77,
        };
    }
}