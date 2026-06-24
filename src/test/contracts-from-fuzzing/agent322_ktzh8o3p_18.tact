struct DeepOptional {
    v1: Int?;
    v2: Bool?;
}

struct Layer {
    label: String?;
    inner: DeepOptional?;
}

contract MixOptInit {
    state: Layer = Layer{
        label: null,
        inner: DeepOptional{ v1: 42, v2: null }
    };
}