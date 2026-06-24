struct OptionalStructInOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract NestedOptionalInStruct {
    data: OptionalStructInOptional;

    init() {
        self.data = OptionalStructInOptional{
            inner: InnerOpt{
                x:null,
                y:true,
            }
        };
    }
}