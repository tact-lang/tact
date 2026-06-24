struct OptionalInnerS {
    x: Int?;
}

struct ContainerOptStruct {
    s1: OptionalInnerS?;
    s2: OptionalInnerS?;
}

contract DoubleOptionalStructs {
    s: ContainerOptStruct;

    init() {
        self.s = ContainerOptStruct{
            s1: null,
            s2: OptionalInnerS{x: null}
        };
    }
}
