struct SubStruct {
    x: Int;
    y: String;
    z: Bool;
}

struct SuperStruct {
    f1: Int;
    f2: SubStruct;
    f3: Bool;
    f4: String;
    f5: SubStruct;
}

contract RepeatedStruct {
    st: SuperStruct;

    init() {
        self.st = SuperStruct{
            f1: 1,
            f2: SubStruct{ x:10, y:"hi", z:true },
            f3: false,
            f4: "yo",
            f5: SubStruct{ x:20, y:"bye", z:false }
        };
    }
}