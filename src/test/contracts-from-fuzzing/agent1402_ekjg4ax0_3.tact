struct NestedStruct {
    n: Int;
    o: Int?;
}

struct OuterStruct {
    a: Int;
    s1: NestedStruct;
    s2: NestedStruct;
}

contract Test3 {
    foo: Int;
    data: OuterStruct;

    init() {
        self.foo = 1;
        self.data = OuterStruct{
            a: 10,
            s1: NestedStruct{n: 1, o: null},
            s2: NestedStruct{n: 2, o: 20}
        };
    }
}