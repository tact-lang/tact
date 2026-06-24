struct DeepManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct LayerA {
    inner: DeepManyOptions?;
}

contract NullableDeep {
    payload: LayerA;

    init() {
        self.payload = LayerA{
            inner: null
        };
    }
}