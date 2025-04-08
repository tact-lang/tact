struct SubStruct1 { x: String; }
struct SubStruct2 { y: Bool; }

struct ParentStruct {
    i: Int;
    sub1: SubStruct1;
    sub2: SubStruct2;
}

contract ComplexNested {
    data: ParentStruct;

    init() {
        self.data = ParentStruct{
            i:10,
            sub1: SubStruct1{x:"hi"},
            sub2: SubStruct2{y:true},
        };
    }
}