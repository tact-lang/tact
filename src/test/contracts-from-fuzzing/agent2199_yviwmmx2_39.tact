struct NestedNested {
    a: InnerStruct;
}

struct InnerStruct {
    b: Bool;
    c: Int;
}

contract ChainNestedFields {
    data: NestedNested;
    init() {
        self.data = NestedNested{a: InnerStruct{b:true, c:5}};
    }
}
