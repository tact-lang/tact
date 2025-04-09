struct NestStruct {
    a: Int;
    b: Bool;
    c: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract DeepNestTest {
    nested: NestStruct;
    
    init() {
        self.nested = NestStruct{
            a: 1,
            b: true,
            c: InnerStruct{ x: 10, y: null }
        };
    }
}