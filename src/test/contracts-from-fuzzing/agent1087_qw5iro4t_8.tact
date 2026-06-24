struct NestedOpt {
    maybeInt: Int?;
    maybeAddr: Address?;
}

struct Complex {
    opt1: NestedOpt?;
    opt2: NestedOpt?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            opt1: null,
            opt2: NestedOpt{
                maybeInt: 42,
                maybeAddr: null,
            }
        };
    }

    receive() {}
}