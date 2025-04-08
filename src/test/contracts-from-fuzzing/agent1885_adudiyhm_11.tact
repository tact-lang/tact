struct InnerMost {
    str: String;
    flag: Bool?;
}

struct Step2 {
    inner: InnerMost;
}

struct Step1 {
    s2: Step2?;
}

contract NestedOpt {
    data: Step1;

    init() {
        self.data = Step1{
            s2: Step2{
                inner: InnerMost{
                    str: "abc",
                    flag: null
                }
            }
        };
    }
}