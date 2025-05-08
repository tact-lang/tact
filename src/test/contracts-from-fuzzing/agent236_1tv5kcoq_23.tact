struct MixNestedOpt {
    x: Int?;
    s: NestedOpt?;
}

struct NestedOpt {
    y: Bool?;
    z: Int;
}

contract OptionalsNestedInStruct {
    data: MixNestedOpt;

    init() {
        self.data = MixNestedOpt{
            x:null,
            s:NestedOpt{y:null,z:10}
        };
    }
}