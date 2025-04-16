struct SDeepOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct SWrap {
    inner: SDeepOpt?;
}

contract NestedOptionalStructField {
    some: SWrap;

    init() {
        self.some = SWrap{ inner: null };
    }
}
