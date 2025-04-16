struct MultiLayerOptional {
    first: Int?; 
    second: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool?;
}

contract TestContract {
    layered: MultiLayerOptional;

    init() {
        self.layered = MultiLayerOptional{
            first: null,
            second: null
        };
    }
}