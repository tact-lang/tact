struct Compose {
    one: SubStruct;
    two: SubStruct;
    three: SubStruct;
}

struct SubStruct {
    val: Int;
    flag: Bool;
}

contract Test {
    c: Compose;

    init() {
        self.c = Compose{
            one: SubStruct{val:1,flag:true},
            two: SubStruct{val:2,flag:false},
            three: SubStruct{val:3,flag:true}
        };
    }
}