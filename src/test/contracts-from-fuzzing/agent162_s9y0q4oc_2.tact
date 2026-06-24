struct OptionalLayers {
    val1: Int?;
    val2: String?;
    val3: Bool?;
}

contract TestContract {
    data: OptionalLayers;

    init() {
        self.data = OptionalLayers{
            val1: 42,
            val2: null,
            val3: true
        };
    }
}