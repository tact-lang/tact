struct HasString {
    s: String;
}

struct ContainsHasString {
    inner: HasString;
}

contract StringNest {
    a: ContainsHasString;

    init() {
        self.a = ContainsHasString{
            inner: HasString{
                s: "hello"
            }
        };
    }
}