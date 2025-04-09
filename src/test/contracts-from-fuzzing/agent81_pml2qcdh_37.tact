struct SubStruct {
    a: Int;
    b: Bool?;
}

struct MainStruct {
    s1: SubStruct;
    s2: SubStruct;
}

contract Test {
    f: MainStruct;

    init() {
        self.f = MainStruct{
            s1: SubStruct{a:1,b:true},
            s2: SubStruct{a:2,b:null}
        };
    }
}