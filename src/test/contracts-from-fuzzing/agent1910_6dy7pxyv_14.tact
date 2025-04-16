struct OptionalStrings {
    foo: String?;
    bar: String?;
}

contract OptStr {
    dat: OptionalStrings;

    init() {
        self.dat = OptionalStrings{
            foo: null,
            bar: null
        };
    }
}
