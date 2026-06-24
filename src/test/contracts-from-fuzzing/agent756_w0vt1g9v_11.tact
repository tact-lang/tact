struct NestedStruct1 {
    a: Int;
    b: NestedStruct2;
}

struct NestedStruct2 {
    c: Int;
    d: NestedStruct3;
}

struct NestedStruct3 {
    e: Int;
    f: String;
}

contract ChainNested {
    data: NestedStruct1;
    init() {
        self.data = NestedStruct1{
            a: 1,
            b: NestedStruct2{
                c: 2,
                d: NestedStruct3{
                    e: 3,
                    f: "end",
                },
            },
        };
    }
}