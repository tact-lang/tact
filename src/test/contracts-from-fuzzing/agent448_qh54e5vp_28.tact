struct NestOption {
    x: Int?;
}

struct WrapOption {
    inner: NestOption?;
}

contract WrapOptField {
    field: WrapOption;

    init() {
        self.field = WrapOption{ inner: NestOption{ x: null } };
    }
}