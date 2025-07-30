// Deep optional chain in a struct with explicit serialization
struct DeepOptionalSerialize {
    inner: InnerOptSerialize?;
}

struct InnerOptSerialize {
    val1: Int? as uint8;
    val2: Bool?;
}

contract DeepOptSerializeContract {
    field: DeepOptionalSerialize;

    init() {
        self.field = DeepOptionalSerialize{
            inner: null,
        };
    }
}