struct NestedInnerStruct {
    a: Int;
    b: Bool;
}

struct NestedOuterStruct {
    nested: NestedInnerStruct; 
    c: String;
}

contract TestContract {
    data: NestedOuterStruct;
    
    init() {
        self.data = NestedOuterStruct{
            nested: NestedInnerStruct{a: 1, b: true},
            c: "hello"
        };
    }
}