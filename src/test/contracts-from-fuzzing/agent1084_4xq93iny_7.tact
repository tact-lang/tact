struct StringAndOptionals {
    one: String;
    two: String?;
    three: String?;
}

contract StringOptionals {
    info: StringAndOptionals;

    init() {
        self.info = StringAndOptionals{
            one: "abc",
            two: null,
            three: null,
        };
    }
}