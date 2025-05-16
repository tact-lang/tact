struct OptionalLayer {
    layer1: Int?;
    layer2: Bool?;
    layer3: String?;
}

struct WrapOptional {
    optionalData: OptionalLayer;
}

contract TestContract {
    data: WrapOptional;
    init() {
        self.data = WrapOptional{
            optionalData: OptionalLayer{
                layer1: null,
                layer2: null,
                layer3: "hello"
            }
        };
    }
}