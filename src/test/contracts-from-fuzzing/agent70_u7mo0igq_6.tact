struct StringFields {
    s1: String;
    s2: String;
}

contract TestContract {
    strings: StringFields;

    init() {
        self.strings = StringFields{
            s1: "Hello",
            s2: "World"
        };
    }
}