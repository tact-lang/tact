struct DeepStruct {
    s1: InnerStruct;
    s2: InnerStruct;
}

struct InnerStruct {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract DeepTest {
    deepField: DeepStruct;
    init() {
        self.deepField = DeepStruct{
            s1: InnerStruct{ f1: 1, f2: true, f3: "a" },
            s2: InnerStruct{ f1: 2, f2: false, f3: "b" }
        };
    }
}