struct OptionalDeep {
    layer: InnerLayer?;
}

struct InnerLayer {
    next: NextLayer?;
}

struct NextLayer {
    leaf: Bool?;
}

contract TestContract {
    optionalDeep: OptionalDeep;

    init() {
        self.optionalDeep = OptionalDeep{
            layer: InnerLayer{
                next: NextLayer{
                    leaf: true
                }
            }
        };
    }
}
