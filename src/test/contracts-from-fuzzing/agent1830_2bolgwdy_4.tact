struct OptionalPrimitive {
    flag: Bool?;
    text: String?;
    ref: Cell?;
}

contract TestContract {
    data: OptionalPrimitive;

    init() {
        self.data = OptionalPrimitive{
            flag: true,
            text: null,
            ref: null
        };
    }
}
