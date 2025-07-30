struct InnerOpt {
    innerField: Int?;
}

struct OuterOpt {
    outerField: InnerOpt?;
}

contract OptionalInsideOptionalStruct {
    myField: OuterOpt;

    init() {
        self.myField = OuterOpt{
            outerField: InnerOpt{ innerField: null }
        };
    }
}