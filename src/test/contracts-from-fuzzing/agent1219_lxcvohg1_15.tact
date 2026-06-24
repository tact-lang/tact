// Multiple layers of structs containing optional nested structs where inner is null
struct InnerMost {
    x: Int;
}

struct Middle {
    inn: InnerMost?;
}

struct OuterMost {
    mid: Middle?;
}

contract MultiLayerNull {
    store: OuterMost;

    init() {
        self.store = OuterMost{ mid: null };
    }
}