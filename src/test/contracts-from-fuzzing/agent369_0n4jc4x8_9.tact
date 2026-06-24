struct NestedWithOptionals {
    sub1: SubStruct?;
    sub2: SubStruct;
}

struct SubStruct {
    int1: Int?;
    str: String?;
}

contract NestedWithOptionalsTest {
    nested: NestedWithOptionals;

    init() {
        self.nested = NestedWithOptionals{
            sub1: SubStruct{int1:null,str:null},
            sub2: SubStruct{int1:10,str:"hello"},
        };
    }
}