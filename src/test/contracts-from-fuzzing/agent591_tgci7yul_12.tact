struct MultiNested {
    i: Int;
    s: String;
    b: Bool;
}

struct Container {
    field1: MultiNested;
    field2: MultiNested;
    field3: MultiNested;
}

contract NestedManyFields {
    data: Container;
    
    init() {
        self.data = Container{
            field1: MultiNested{ i:1, s:"a", b:true },
            field2: MultiNested{ i:2, s:"b", b:false },
            field3: MultiNested{ i:3, s:"c", b:true }
        };
    }
}