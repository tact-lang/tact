struct OptBoolInt {
    flag: Bool?;
    num: Int?;
}

struct NestOpt {
    inner: OptBoolInt?;
}

contract OptionalOfOptional {
    top: NestOpt;

    init() {
        self.top = NestOpt{ inner: null };
    }
}