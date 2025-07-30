struct HasStrings {
    a: String;
    b: String?;
}

contract TestContract {
    data: HasStrings;

    init() {
        self.data = HasStrings{
            a: "foo",
            b: null
        };
    }
}