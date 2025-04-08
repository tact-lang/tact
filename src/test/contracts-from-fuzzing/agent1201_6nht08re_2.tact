struct StructureA {
    a: Int;
    b: SubStruct;
}

struct SubStruct {
    c: Int;
}

contract TestContract {
    field1: StructureA;
    field2: StructureA;
    field3: StructureA;
    field4: StructureA;
    
    init() {
        self.field1 = StructureA{ a:1, b:SubStruct{c:1} };
        self.field2 = StructureA{ a:2, b:SubStruct{c:2} };
        self.field3 = StructureA{ a:3, b:SubStruct{c:3} };
        self.field4 = StructureA{ a:4, b:SubStruct{c:4} };
    }
}