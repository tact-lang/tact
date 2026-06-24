struct SubStruct {
    i: Int;
}

struct WrapOpt {
    s: SubStruct?;
}

struct TopStruct {
    wrap: WrapOpt;
}

contract ComplexOptionalNest {
    dat: TopStruct;

    init() {
        self.dat = TopStruct{
            wrap: WrapOpt{
                s: null
            }
        };
    }
}
