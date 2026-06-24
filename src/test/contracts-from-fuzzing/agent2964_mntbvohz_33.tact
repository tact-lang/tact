struct WrappedOption {
    inner: Int?;
}

struct WrapOuter {
    w: WrappedOption;
}

contract WrappedOptional {
    val: WrapOuter;

    init() {
        self.val = WrapOuter{
            w: WrappedOption{
                inner: null
            }
        };
    }
}