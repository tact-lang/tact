// Struct with Bool serialization varieties
struct BoolTypes {
    a: Bool;
    b: Bool?;
}

contract BoolVariants {
    data: BoolTypes;
    init() {
        self.data = BoolTypes {
            a: true,
            b: null,
        };
    }
}
