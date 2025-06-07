struct OptionalLayer {
    layer1: Layer1?;
}

struct Layer1 {
    layer2: Layer2?;
}

struct Layer2 {
    layer3: Layer3?;
}

struct Layer3 {
    i: Int?;
}

contract DeepOptionalLayers {
    deep: OptionalLayer = OptionalLayer{ layer1:null };
}