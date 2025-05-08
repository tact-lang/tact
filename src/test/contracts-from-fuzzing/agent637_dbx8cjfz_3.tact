struct OptionalsNested {
    x: Int?;
    y: Bool?;
    s: SubOpt?;
}

struct SubOpt {
    z: Int?;
    flag: Bool;
}

contract TestContract {
    optStruct: OptionalsNested;

    init() {
        self.optStruct = OptionalsNested{
            x: null,
            y: true,
            s: SubOpt{
                z: null,
                flag: false
            }
        };
    }
}