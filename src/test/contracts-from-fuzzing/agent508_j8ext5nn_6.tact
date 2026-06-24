struct NestOpt {
    p: Int?;
    s: String?;
    b: Bool?;
}

struct WrapOpt {
    first: NestOpt?;
    second: NestOpt?;
}

contract TestContract {
    data: WrapOpt;
    init() {
        self.data = WrapOpt{
            first: null,
            second: NestOpt{ p: 5, s: null, b: true }
        };
    }
}