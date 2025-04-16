struct DeeplyOptionalStruct {
    opt1: Int?;
    opt2: Bool?;
    opt3: NestedOpt?;
}

struct NestedOpt {
    innerOpt: String?;
}

contract DeepOpt {
    st: DeeplyOptionalStruct;

    init() {
        self.st = DeeplyOptionalStruct{
            opt1:null,
            opt2:true,
            opt3:NestedOpt{innerOpt:null},
        };
    }
}
