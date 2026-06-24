struct StringsAndOptionals {
    s1: String?;
    s2: String;
    s3: String?;
    s4: String;
}

contract TestContract {
    data: StringsAndOptionals;
    init() {
        self.data = StringsAndOptionals{
            s1: null,
            s2: "hello",
            s3: "world",
            s4: "!"
        };
    }
}