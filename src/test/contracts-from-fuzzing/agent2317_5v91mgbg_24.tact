struct DeepStruct {
    s1: Int;
    s2: SubStruct;
}

struct SubStruct {
    subval: Int;
    opt: Bool?;
}

contract ComplexStruct {
    val: DeepStruct;

    init() {
        self.val = DeepStruct{
            s1: 7,
            s2: SubStruct{subval: 9, opt: null}
        };
    }
}