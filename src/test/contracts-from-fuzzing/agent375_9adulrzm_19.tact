struct HasString {
    s1: String;
    s2: String = "default";
}

contract TestContract {
    data: HasString;

    init() {
        self.data = HasString{
            s1: "value",
            s2: "overridden"
        };
    }
}
