struct DeepOption {
    a: Int?;
    b: SubOption?;
}

struct SubOption {
    c: Bool?;
}

contract DeepOptionalFields {
    val: DeepOption;
    init() {
        self.val = DeepOption{
            a: null,
            b: SubOption{ c: null }
        };
    }
}