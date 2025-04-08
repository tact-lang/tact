struct SubStruct {
    value: Int;
    flag: Bool;
}

struct MainStruct {
    s1: SubStruct;
    s2: SubStruct;
}

contract SameSubMany {
    composed: MainStruct;

    init() {
        self.composed = MainStruct{
            s1: SubStruct{value: 1, flag: true},
            s2: SubStruct{value: 2, flag: false},
        };
    }
}
