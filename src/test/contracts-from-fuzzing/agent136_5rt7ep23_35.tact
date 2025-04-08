struct OptionalDeep {
    x: Int?;
}

struct MiddleOpt {
    y: OptionalDeep?;
}

contract OptionChain {
    z: MiddleOpt;

    init() {
        self.z = MiddleOpt{
            y: OptionalDeep{ x: null }
        };
    }
}