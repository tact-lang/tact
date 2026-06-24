struct NestedMany {
    l1: NestedL1;
    l2: NestedL2;
}

struct NestedL1 {
    x: Int; y: Bool; z: String;
}

struct NestedL2 {
    l3: NestedL3;
    intVal: Int;
}

struct NestedL3 {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedManyTest {
    data: NestedMany;

    init() {
        self.data = NestedMany{
            l1: NestedL1{ x:1,y:true,z:"a" },
            l2: NestedL2{ l3: NestedL3{ a:null,b:null,c:null }, intVal:5 }
        };
    }
}