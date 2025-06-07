struct StringStuff {
    name: String = "";
    greeting: String;
    optionalNote: String?;
}

contract TestContract {
    s: StringStuff;
    init() {
        self.s = StringStuff{
            // omit name, default ""
            greeting: "hi",
            optionalNote: null
        };
    }
}