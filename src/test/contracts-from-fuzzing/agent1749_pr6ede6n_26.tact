struct InnerMany {
    a: Int;
    b: Bool;
    c: String;
}

struct OuterMany {
    i1: InnerMany;
    i2: InnerMany;
    i3: InnerMany;
}

contract NestedManyStructs {
    content: OuterMany;
    init() {
        self.content = OuterMany{
            i1: InnerMany{ a:1, b:true, c:"x" },
            i2: InnerMany{ a:2, b:false, c:"y" },
            i3: InnerMany{ a:3, b:true, c:"z" }
        };
    }
}