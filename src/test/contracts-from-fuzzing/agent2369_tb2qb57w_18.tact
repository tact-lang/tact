struct OptionalLayer {
    inner: Int?;
}

struct OuterOpt {
    layer: OptionalLayer?;
}

contract OptionalNested {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            layer: OptionalLayer{
                inner: null
            }
        };
    }
}