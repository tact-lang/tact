struct OuterMost {
    s1: Int;
    s2: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    innerVal: DeeperStruct;
}

struct DeeperStruct {
    txt: String;
    num: Int;
}

contract DeepComplex {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            s1: 1,
            s2: InnerStruct{
                flag: false,
                innerVal: DeeperStruct{
                    txt: "hello",
                    num: 999
                }
            }
        };
    }
}