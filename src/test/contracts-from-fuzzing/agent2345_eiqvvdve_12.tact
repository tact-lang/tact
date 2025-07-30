struct DeepOptionNest {
    opt1: Int?;
    opt2: String?;
    sub: SubOptStruct?;
}

struct SubOptStruct {
    a: Bool;
    b: String;
}

contract OptNest {
    valopt: DeepOptionNest;

    init() {
        self.valopt = DeepOptionNest{
            opt1: null,
            opt2: "hello",
            sub: null
        };
    }
}