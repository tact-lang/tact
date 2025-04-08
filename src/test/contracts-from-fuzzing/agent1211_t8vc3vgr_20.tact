struct OptionalLayer {
    inner: InnerStruct?;
}

struct InnerStruct {
    data: Int?;
}

contract OptionalLayers {
    field: OptionalLayer;
    init() {
        self.field = OptionalLayer{
            inner: InnerStruct{
                data: null,
            },
        };
    }
}