struct NestedStruct {
    innerA: Int;
    innerB: Bool;
}

struct TopStruct {
    first: NestedStruct;
    second: NestedStruct;
    third: NestedStruct;
}

contract TestContract {
    complex: TopStruct;

    init() {
        self.complex = TopStruct{
            first: NestedStruct{ innerA:1, innerB:true },
            second: NestedStruct{ innerA:2, innerB:false },
            third: NestedStruct{ innerA:3, innerB:true },
        };
    }
}