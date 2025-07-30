struct BoolIntStruct {
    flag: Bool;
    val: Int;
}

struct Wrapper {
    inner1: BoolIntStruct;
    inner2: BoolIntStruct;
    inner3: BoolIntStruct;
}

contract MultiNested {
    wrapped: Wrapper;

    init() {
        self.wrapped = Wrapper{
            inner1: BoolIntStruct{ flag:true, val:1 },
            inner2: BoolIntStruct{ flag:false, val:2 },
            inner3: BoolIntStruct{ flag:true, val:3 }
        };
    }
}