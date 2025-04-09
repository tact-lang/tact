struct Sub {
    x: Int?;
    y: Bool?;
}

struct MainStruct {
    str: String;
    sub: Sub;
    opt: Sub?;
}

contract OptionalStructMix {
    field: MainStruct;

    init() {
        self.field = MainStruct{
            str: "hi",
            sub: Sub{ x:null, y:true },
            opt: null,
        };
    }
}