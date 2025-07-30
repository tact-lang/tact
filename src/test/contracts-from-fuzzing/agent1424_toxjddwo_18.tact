struct ComplexSub {
    a: Int; b: Int?; c: Bool;
}

struct MainStruct {
    x: Int;
    sub: ComplexSub;
    y: Bool?;
    z: String?;
}

contract NestedReadiness {
    persist: MainStruct;

    init() {
        self.persist = MainStruct{
            x: 42,
            sub: ComplexSub{a:1,b:null,c:false},
            y: null,
            z: null
        };
    }
}