struct OptionalDeeper {
    innerOpt: Inner?;
}

struct Inner {
    value: Int;
    text: String?;
}

contract TestContract {
    d: OptionalDeeper;

    init() {
        self.d = OptionalDeeper{
            innerOpt: null,
        };
    }
}