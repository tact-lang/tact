struct MultiLayerOptionals {
    l1: Int?;
    l2: Layer2?;
}

struct Layer2 {
    l3: Layer3?;
}

struct Layer3 {
    val: String?;
}

contract OptionalDeep {
    data: MultiLayerOptionals;

    init() {
        self.data = MultiLayerOptionals{
            l1: null,
            l2: Layer2{ l3: Layer3{ val: null } }
        };
    }
}