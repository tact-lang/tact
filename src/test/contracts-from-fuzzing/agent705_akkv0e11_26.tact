struct TinyStruct {
    a: Int;
}

struct MidStruct {
    t1: TinyStruct;
    t2: TinyStruct;
}

struct LargeStruct {
    m1: MidStruct;
    m2: MidStruct;
    m3: MidStruct;
}

contract StructDeepWidth {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            m1: MidStruct{ t1:TinyStruct{a:1}, t2:TinyStruct{a:2} },
            m2: MidStruct{ t1:TinyStruct{a:3}, t2:TinyStruct{a:4} },
            m3: MidStruct{ t1:TinyStruct{a:5}, t2:TinyStruct{a:6} }
        };
    }
}