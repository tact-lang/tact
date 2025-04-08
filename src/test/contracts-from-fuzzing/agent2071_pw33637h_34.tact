struct MiddleOpt {
    val: Int?;
}

struct WrapperNull {
    inner: MiddleOpt?;
}

contract ContractNullInner {
    w: WrapperNull;

    init() {
        self.w = WrapperNull{
            inner: null
        };
    }
}