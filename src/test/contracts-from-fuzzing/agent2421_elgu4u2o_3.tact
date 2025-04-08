struct WrappedStringOpt {
    x: Int;
    y: String?;
}

contract TestOptInStruct {
    field: WrappedStringOpt;

    init() {
        self.field = WrappedStringOpt{
            x: 7,
            y: null
        };
    }
}