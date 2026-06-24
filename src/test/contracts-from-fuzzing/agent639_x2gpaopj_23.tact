struct SubStruct1 { x: Int }
struct SubStruct2 { y: Bool }

struct ComplexStruct {
    s1: SubStruct1;
    s2: SubStruct2;
    val: Int;
}

contract MultiNested {
    c: ComplexStruct;
    init() {
        self.c = ComplexStruct{
            s1: SubStruct1{ x:10 },
            s2: SubStruct2{ y:true },
            val: 42
        };
    }
}