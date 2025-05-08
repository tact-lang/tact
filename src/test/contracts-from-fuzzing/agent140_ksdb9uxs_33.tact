struct InnerOpts {
    b: Bool?;
    s: String?;
    n: Int?;
}

struct WrapOpt {
    wrapped: InnerOpts?;
}

contract OptWrapped {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{
            wrapped: null
        };
    }
}