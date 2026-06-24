struct SubNested {
    foo: Int;
    bar: Bool?;
}

struct NestedStruct {
    s1: SubNested;
    s2: SubNested;
    name: String;
}

contract NestedFields {
    info: NestedStruct;
    
    init() {
        self.info = NestedStruct{
            s1: SubNested{ foo: 5, bar: null },
            s2: SubNested{ foo: 10, bar: true },
            name: "nested"
        };
    }
}