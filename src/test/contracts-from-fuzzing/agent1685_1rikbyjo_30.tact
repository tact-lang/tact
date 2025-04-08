struct ComplexLayer {
    x: Int?;
    y: Bool?;
    s: String;
    addr: Address?;
}

struct WrappedLayer {
    part: ComplexLayer;
    more: Int;
}

contract MultiLayerContract {
    state: WrappedLayer;

    init() {
        self.state = WrappedLayer{
            part: ComplexLayer{
                x: null,
                y: true,
                s: "layer",
                addr: null
            },
            more: 99
        };
    }
}
