struct SubInner { val: Int?; }

struct BigContainer {
    optPrimitive: Int?;
    optStruct: SubInner?;
}

contract DoubleOptionalMix {
    state: BigContainer;

    init() {
        self.state = BigContainer{
            optPrimitive: null,
            optStruct: null
        };
    }
}