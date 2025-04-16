struct HasString {
    s: String;
    optS: String?;
}

contract TestStringFields {
    val: HasString;
    init() {
        self.val = HasString{
            s: "hello",
            optS: null
        };
    }
}
