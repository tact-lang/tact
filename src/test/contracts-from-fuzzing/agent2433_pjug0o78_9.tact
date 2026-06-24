struct StringsAndOptionals {
    first: String;
    second: String;
    opt1: String?;
    opt2: String?;
}

contract StringsOptionalContract {
    data: StringsAndOptionals;

    init() {
        self.data = StringsAndOptionals{
            first: "a",
            second: "b",
            opt1: null,
            opt2: null
        };
    }
}