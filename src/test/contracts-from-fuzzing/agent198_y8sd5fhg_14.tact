struct Inner2 {
    x: Int;
    y: Bool?;
}

struct Inner1 {
    payload: Inner2?;
    z: String?;
}

contract DeepNestedOption {
    storage: Inner1;

    init() {
        self.storage = Inner1{
            payload: null,
            z: null
        };
    }
}
